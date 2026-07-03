@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SAP Module Value Help'
@Metadata.ignorePropagatedAnnotations: true

@Search.searchable: true

define view entity ZI_ZAKA_MODULE_VH
  as select from zaka_inc_module
{
  @Search.defaultSearchElement: true
  key module_id   as ModuleId,

  @Search.defaultSearchElement: true
      module_desc as ModuleDescription

}
where is_active = 'X'
