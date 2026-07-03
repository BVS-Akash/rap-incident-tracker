@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Pending With Value Help'
@Metadata.ignorePropagatedAnnotations: true

@Search.searchable: true

define view entity ZI_ZAKA_PENDING_VH
  as select from zaka_inc_pending
{
  @Search.defaultSearchElement: true
  key pending_id   as PendingId,

  @Search.defaultSearchElement: true
      pending_desc as PendingDescription

}
where is_active = 'X'
