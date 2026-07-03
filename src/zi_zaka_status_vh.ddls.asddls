@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Status Value Help'
@Metadata.ignorePropagatedAnnotations: true

@Search.searchable: true

define view entity ZI_ZAKA_STATUS_VH
  as select from zaka_inc_status
{
  @Search.defaultSearchElement: true
  key status_id   as StatusId,

  @Search.defaultSearchElement: true
      status_desc as StatusDescription

}
where is_active = 'X'
