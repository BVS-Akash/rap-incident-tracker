CLASS lhc_Incident DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Incident RESULT result.

    METHODS ValidateDuplicateIncident FOR VALIDATE ON SAVE
      IMPORTING keys FOR Incident~ValidateDuplicateIncident.

ENDCLASS.

CLASS lhc_Incident IMPLEMENTATION.

  METHOD get_global_authorizations.
    result-%create = if_abap_behv=>auth-allowed.
    result-%update = if_abap_behv=>auth-allowed.
    result-%delete = if_abap_behv=>auth-allowed.
  ENDMETHOD.

  METHOD ValidateDuplicateIncident.

    READ ENTITIES OF zi_zaka_inc_hdr IN LOCAL MODE
      ENTITY Incident
      FIELDS ( IncidentId )
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_incidents).

    IF lt_incidents IS INITIAL.
      RETURN.
    ENDIF.

*--------------------------------------------------------------------
* Check duplicate Incident IDs within current request
*--------------------------------------------------------------------

    TYPES:
      BEGIN OF ty_duplicate,
        incident_id TYPE zaka_inc_hdr-incident_id,
        count       TYPE i,
      END OF ty_duplicate.

    DATA lt_duplicates TYPE HASHED TABLE OF ty_duplicate
                       WITH UNIQUE KEY incident_id.

    LOOP AT lt_incidents ASSIGNING FIELD-SYMBOL(<ls_incident>).

      ASSIGN lt_duplicates[
        incident_id = <ls_incident>-IncidentId ]
        TO FIELD-SYMBOL(<ls_duplicate>).

      IF sy-subrc = 0.

        <ls_duplicate>-count += 1.

      ELSE.

        INSERT VALUE #(
          incident_id = <ls_incident>-IncidentId
          count       = 1 )
        INTO TABLE lt_duplicates.

      ENDIF.

    ENDLOOP.

    LOOP AT lt_incidents ASSIGNING <ls_incident>.

      ASSIGN lt_duplicates[
        incident_id = <ls_incident>-IncidentId ]
        TO <ls_duplicate>.

      IF sy-subrc = 0
         AND <ls_duplicate>-count > 1.

        APPEND VALUE #(
          %tky = <ls_incident>-%tky
        ) TO failed-Incident.

        APPEND VALUE #(
          %tky = <ls_incident>-%tky
          %msg = new_message(
                   id       = 'ZAKA_INC_MSG'
                   number   = '002'
                   severity = if_abap_behv_message=>severity-error
                   v1       = <ls_incident>-IncidentId )
        ) TO reported-Incident.

      ENDIF.

    ENDLOOP.

*--------------------------------------------------------------------
* Check duplicate Incident IDs already existing in database
*--------------------------------------------------------------------

    SELECT incident_id
      FROM zaka_inc_hdr
      FOR ALL ENTRIES IN @lt_incidents
      WHERE incident_id = @lt_incidents-IncidentId
      INTO TABLE @DATA(lt_existing).

    IF lt_existing IS INITIAL.
      RETURN.
    ENDIF.

    SORT lt_existing BY incident_id.

    LOOP AT lt_incidents ASSIGNING <ls_incident>.

      READ TABLE lt_existing
        WITH KEY incident_id = <ls_incident>-IncidentId
        TRANSPORTING NO FIELDS
        BINARY SEARCH.

      IF sy-subrc = 0.

        APPEND VALUE #(
          %tky = <ls_incident>-%tky
        ) TO failed-Incident.

        APPEND VALUE #(
          %tky = <ls_incident>-%tky
          %msg = new_message(
                   id       = 'ZAKA_INC_MSG'
                   number   = '001'
                   severity = if_abap_behv_message=>severity-error
                   v1       = <ls_incident>-IncidentId )
        ) TO reported-Incident.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
