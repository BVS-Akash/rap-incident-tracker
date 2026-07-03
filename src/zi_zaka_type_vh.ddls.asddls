@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Incident Type Value Help'
@Metadata.ignorePropagatedAnnotations: true

@Search.searchable: true

define view entity ZI_ZAKA_TYPE_VH
  as select from zaka_inc_type
{
  @Search.defaultSearchElement: true
  key type_id   as TypeId,

  @Search.defaultSearchElement: true
      type_desc as TypeDescription

}
where is_active = 'X'
