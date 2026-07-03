@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Priority Value Help'
@Metadata.ignorePropagatedAnnotations: true

@Search.searchable: true

define view entity ZI_ZAKA_PRIORITY_VH
  as select from zaka_inc_prty
{
  @Search.defaultSearchElement: true
  key priority_id   as PriorityId,

  @Search.defaultSearchElement: true
      priority_desc as PriorityDescription

}
where is_active = 'X'
