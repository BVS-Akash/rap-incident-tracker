@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Incident Activity Log'
@Metadata.allowExtensions: true
define view entity ZC_ZAKA_MGMT_INC_LOG
  as projection on ZI_ZAKA_INC_LOG
{
      @EndUserText.label: 'Activity Number'
  key ActivityId,

      @EndUserText.label: 'Incident Number'
      IncidentId,

      @EndUserText.label: 'Activity Type'
      ActivityType,

      @EndUserText.label: 'Field Name'
      FieldName,

      @EndUserText.label: 'Old Value'
      OldValue,

      @EndUserText.label: 'New Value'
      NewValue,

      @EndUserText.label: 'Activity Description'
      ActivityText,

      @EndUserText.label: 'Changed By'
      ChangedBy,

      @EndUserText.label: 'Changed On'
      ChangedAt,

      _Incident : redirected to parent ZC_ZAKA_MGMT_INC_HDR

}
