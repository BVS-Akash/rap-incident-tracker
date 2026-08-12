@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Incident Attachments'
@Metadata.allowExtensions: true

@UI.headerInfo: {
  typeName: 'Attachment',
  typeNamePlural: 'Attachemnts',
  title: {
    type: #STANDARD,
    value: 'AttachmentId'
  }
}

define view entity ZC_ZAKA_MGMT_INC_ATT
  as projection on ZI_ZAKA_INC_ATT
{
      @EndUserText.label: 'Attachment Number'
  key AttachmentId,

      @EndUserText.label: 'Incident Number'
      IncidentId,
    
      @EndUserText.label: 'Attachemnt'
      Attachment,

      @EndUserText.label: 'File Name'
      FileName,

      @EndUserText.label: 'MIME Type'
      MimeType,

      @EndUserText.label: 'Uploaded By'
      UploadedBy,

      @EndUserText.label: 'Uploaded On'
      UploadedAt,

      LocalLastChangedAt,

      _Incident : redirected to parent ZC_ZAKA_MGMT_INC_HDR

}
