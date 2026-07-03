@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Tower Value Help'
@Metadata.ignorePropagatedAnnotations: true

@Search.searchable: true

define view entity ZI_ZAKA_TOWER_VH
  as select from zaka_inc_tower
{
  @Search.defaultSearchElement: true
  key tower_id   as TowerId,

  @Search.defaultSearchElement: true
      tower_desc as TowerDescription

}
where is_active = 'X'
