@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Incident Header'
@Search.searchable: true
define root view entity ZI_ZAKA_INC_HDR
  as select from zaka_inc_hdr

  composition [0..*] of ZI_ZAKA_INC_LOG as _Log

  composition [0..*] of ZI_ZAKA_INC_CMT as _Comment

  composition [0..*] of ZI_ZAKA_INC_ATT as _Attachment

{
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
  key incident_id           as IncidentId,
      ticket_type           as TicketType,
      tower_id              as TowerId,
      sap_module            as SapModule,
      priority              as Priority,
      status                as Status,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      short_description     as ShortDescription,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      description           as Description,
      requested_by          as RequestedBy,
      assigned_to           as AssignedTo,
      pending_with          as PendingWith,
      resolution_notes      as ResolutionNotes,
      due_date              as DueDate,
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @Semantics.user.lastChangedBy: true
      changed_by            as ChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      changed_at            as ChangedAt,
      closed_at             as ClosedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      // Compositions
      _Log,
      _Comment,
      _Attachment

}
