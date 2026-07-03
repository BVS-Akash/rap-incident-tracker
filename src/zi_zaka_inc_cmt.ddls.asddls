@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Incident Comments'
@Search.searchable: true
define view entity ZI_ZAKA_INC_CMT
  as select from zaka_inc_cmt

  association to parent ZI_ZAKA_INC_HDR as _Incident on $projection.IncidentId = _Incident.IncidentId

{
  key comment_id            as CommentId,
      incident_id           as IncidentId,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      comment_text          as CommentText,
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @Semantics.user.lastChangedBy: true
      updated_by            as UpdatedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      updated_at            as UpdatedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      // Assoiations

      _Incident
}
