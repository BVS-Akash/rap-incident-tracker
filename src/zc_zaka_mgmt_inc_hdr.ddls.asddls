@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Incident Management'
@Metadata.allowExtensions: true

define root view entity ZC_ZAKA_MGMT_INC_HDR
  provider contract transactional_query
  as projection on ZI_ZAKA_INC_HDR
{
  @EndUserText.label: 'Incident Number'
  key IncidentId,

  @EndUserText.label: 'Ticket Type'
  TicketType,

  @EndUserText.label: 'Tower'
  TowerId,

  @EndUserText.label: 'SAP Module'
  SapModule,

  @EndUserText.label: 'Priority'
  Priority,

  @EndUserText.label: 'Status'
  Status,

  @EndUserText.label: 'Short Description'
  ShortDescription,

  @EndUserText.label: 'Detailed Description'
  Description,

  @EndUserText.label: 'Requested By'
  RequestedBy,

  @EndUserText.label: 'Assigned To'
  AssignedTo,

  @EndUserText.label: 'Pending With'
  PendingWith,

  @EndUserText.label: 'Resolution Notes'
  ResolutionNotes,

  @EndUserText.label: 'Due Date'
  DueDate,

  @EndUserText.label: 'Created By'
  CreatedBy,

  @EndUserText.label: 'Created On'
  CreatedAt,

  @EndUserText.label: 'Last Changed By'
  ChangedBy,

  @EndUserText.label: 'Last Changed On'
  ChangedAt,

  @EndUserText.label: 'Local Last Changed At'
  LocalLastChangedAt,

  @EndUserText.label: 'Closed On'
  ClosedAt,

  _Comment    : redirected to composition child ZC_ZAKA_MGMT_INC_CMT,
  _Attachment : redirected to composition child ZC_ZAKA_MGMT_INC_ATT,
  _Log        : redirected to composition child ZC_ZAKA_MGMT_INC_LOG
}
