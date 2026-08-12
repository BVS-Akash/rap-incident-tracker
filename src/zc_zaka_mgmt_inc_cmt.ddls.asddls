@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Incident Comments'
@Metadata.allowExtensions: true

@UI.headerInfo: {
  typeName: 'Comment',
  typeNamePlural: 'Comments',
  title: {
    type: #STANDARD,
    value: 'CommentText'
  }
}

define view entity ZC_ZAKA_MGMT_INC_CMT
  as projection on ZI_ZAKA_INC_CMT
{
      @EndUserText.label: 'Comment Number'
  key CommentId,

      @EndUserText.label: 'Incident Number'
      IncidentId,

      @EndUserText.label: 'Comment'
      CommentText,

      @EndUserText.label: 'Created By'
      CreatedBy,

      @EndUserText.label: 'Created On'
      CreatedAt,

      @EndUserText.label: 'Updated By'
      UpdatedBy,

      @EndUserText.label: 'Updated On'
      UpdatedAt,

      LocalLastChangedAt,

      _Incident : redirected to parent ZC_ZAKA_MGMT_INC_HDR

}
