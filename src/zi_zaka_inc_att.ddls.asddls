@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Incident Attachments'
@Search.searchable: true
define view entity ZI_ZAKA_INC_ATT
  as select from zaka_inc_att

  association to parent ZI_ZAKA_INC_HDR as _Incident on $projection.IncidentId = _Incident.IncidentId
{
  key attachment_id         as AttachmentId,
      incident_id           as IncidentId,
      @Semantics.largeObject:
      { mimeType: 'MimeType',
      fileName: 'FileName',
      contentDispositionPreference: #INLINE }
      attachment_content    as Attachment,
      @Search.defaultSearchElement: true
      file_name             as FileName,
      @Semantics.mimeType: true
      mime_type             as MimeType,
      @Semantics.user.createdBy: true
      uploaded_by           as UploadedBy,
      @Semantics.systemDateTime.createdAt: true
      uploaded_at           as UploadedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      // Associations

      _Incident
}
