CLASS zcl_zaka_inc_data_loader DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PRIVATE SECTION.

    METHODS:
      clear_configuration_data,
      load_priorities,
      load_statuses,
      load_towers,
      load_modules,
      load_types,
      load_pending_values.

ENDCLASS.



CLASS zcl_zaka_inc_data_loader IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    out->write( 'Starting Configuration Data Load...' ).
    clear_configuration_data( ).
    load_priorities( ).
    load_statuses( ).
    load_towers( ).
    load_modules( ).
    load_types( ).
    load_pending_values( ).

    COMMIT WORK.

    out->write( 'Configuration Data Loaded Successfully.' ).

  ENDMETHOD.

  METHOD clear_configuration_data.

    DELETE FROM zaka_inc_prty.
    DELETE FROM zaka_inc_status.
    DELETE FROM zaka_inc_tower.
    DELETE FROM zaka_inc_module.
    DELETE FROM zaka_inc_type.
    DELETE FROM zaka_inc_pending.

  ENDMETHOD.

  METHOD load_priorities.

    DATA lt_prty TYPE STANDARD TABLE OF zaka_inc_prty.

    lt_prty = VALUE #(

      ( priority_id   = 'CRITICAL'
        priority_desc = 'Critical'
        sort_order    = 1
        is_active     = abap_true )

      ( priority_id   = 'HIGH'
        priority_desc = 'High'
        sort_order    = 2
        is_active     = abap_true )

      ( priority_id   = 'MEDIUM'
        priority_desc = 'Medium'
        sort_order    = 3
        is_active     = abap_true )

      ( priority_id   = 'LOW'
        priority_desc = 'Low'
        sort_order    = 4
        is_active     = abap_true )

    ).

    MODIFY zaka_inc_prty FROM TABLE @lt_prty.

  ENDMETHOD.



  METHOD load_statuses.

    DATA lt_status TYPE STANDARD TABLE OF zaka_inc_status.

    lt_status = VALUE #(

      ( status_id   = 'NEW'
        status_desc = 'New'
        is_active   = abap_true )

      ( status_id   = 'OPEN'
        status_desc = 'Open'
        is_active   = abap_true )

      ( status_id   = 'IN_PROGRESS'
        status_desc = 'In Progress'
        is_active   = abap_true )

      ( status_id   = 'PENDING'
        status_desc = 'Pending'
        is_active   = abap_true )

      ( status_id   = 'RESOLVED'
        status_desc = 'Resolved'
        is_active   = abap_true )

      ( status_id   = 'CLOSED'
        status_desc = 'Closed'
        is_active   = abap_true )

    ).

    MODIFY zaka_inc_status FROM TABLE @lt_status.

  ENDMETHOD.



  METHOD load_towers.

    DATA lt_towers TYPE STANDARD TABLE OF zaka_inc_tower.

    lt_towers = VALUE #(

      ( tower_id   = 'APAC'
        tower_desc = 'Asia Pacific'
        is_active  = abap_true )

      ( tower_id   = 'EMEA'
        tower_desc = 'Europe Middle East Africa'
        is_active  = abap_true )

      ( tower_id   = 'AMER'
        tower_desc = 'Americas'
        is_active  = abap_true )

      ( tower_id   = 'LATAM'
        tower_desc = 'Latin America'
        is_active  = abap_true )

      ( tower_id   = 'GLOBAL'
        tower_desc = 'Global Support'
        is_active  = abap_true )

    ).

    MODIFY zaka_inc_tower FROM TABLE @lt_towers.

  ENDMETHOD.



  METHOD load_modules.

    DATA lt_modules TYPE STANDARD TABLE OF zaka_inc_module.

    lt_modules = VALUE #(

      ( module_id   = 'FI'
        module_desc = 'Financial Accounting'
        is_active   = abap_true )

      ( module_id   = 'CO'
        module_desc = 'Controlling'
        is_active   = abap_true )

      ( module_id   = 'MM'
        module_desc = 'Materials Management'
        is_active   = abap_true )

      ( module_id   = 'SD'
        module_desc = 'Sales and Distribution'
        is_active   = abap_true )

      ( module_id   = 'PP'
        module_desc = 'Production Planning'
        is_active   = abap_true )

      ( module_id   = 'QM'
        module_desc = 'Quality Management'
        is_active   = abap_true )

      ( module_id   = 'PM'
        module_desc = 'Plant Maintenance'
        is_active   = abap_true )

    ).

    MODIFY zaka_inc_module FROM TABLE @lt_modules.

  ENDMETHOD.



  METHOD load_types.

    DATA lt_types TYPE STANDARD TABLE OF zaka_inc_type.

    lt_types = VALUE #(

      ( type_id   = 'INCIDENT'
        type_desc = 'Incident'
        is_active = abap_true )

      ( type_id   = 'SERVICE'
        type_desc = 'Service Request'
        is_active = abap_true )

      ( type_id   = 'CHANGE'
        type_desc = 'Change Request'
        is_active = abap_true )

      ( type_id   = 'ENHANCEMENT'
        type_desc = 'Enhancement Request'
        is_active = abap_true )

    ).

    MODIFY zaka_inc_type FROM TABLE @lt_types.

  ENDMETHOD.



  METHOD load_pending_values.

    DATA lt_pending TYPE STANDARD TABLE OF zaka_inc_pending.

    lt_pending = VALUE #(

          ( pending_id   = 'BUSINESS'
            pending_desc = 'Business Team'
            is_active    = abap_true )

          ( pending_id   = 'ABAP'
            pending_desc = 'ABAP Team'
            is_active    = abap_true )

          ( pending_id   = 'BASIS'
            pending_desc = 'Basis Team'
            is_active    = abap_true )

          ( pending_id   = 'FUNCTIONAL'
            pending_desc = 'Functional Team'
            is_active    = abap_true )

          ( pending_id   = 'THIRD_PARTY'
            pending_desc = 'Third Party Vendor'
            is_active    = abap_true )

        ).


    MODIFY zaka_inc_pending FROM TABLE @lt_pending.

  ENDMETHOD.

ENDCLASS.
