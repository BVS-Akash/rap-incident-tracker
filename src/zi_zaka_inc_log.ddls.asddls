@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Incident Activity Log'

define view entity ZI_ZAKA_INC_LOG
  as select from zaka_inc_log

  association to parent ZI_ZAKA_INC_HDR as _Incident on $projection.IncidentId = _Incident.IncidentId

{
  key activity_id   as ActivityId,
      incident_id   as IncidentId,
      activity_type as ActivityType,
      field_name    as FieldName,
      old_value     as OldValue,
      new_value     as NewValue,
      activity_text as ActivityText,
      @Semantics.user.lastChangedBy: true
      changed_by    as ChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      changed_at    as ChangedAt,

      // Associations

      _Incident
}
