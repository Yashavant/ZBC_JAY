@EndUserText.label: 'Travel BO Projection View'
@AccessControl.authorizationCheck: #CHECK

@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_RAP_TRAVEL_YASH 
as projection on ZI_RAP_TRAVEL_YASH as Travel
{
    //ZI_RAP_TRAVEL_YASH
    key TravelUUID,
    @Search.defaultSearchElement: true
    TravelID,
    @Search.defaultSearchElement: true
    @ObjectModel.text.element: ['AgencyName'] //Display Name of Agency while searching
    @Consumption.valueHelpDefinition: [{ entity :{ name: '/DMO/I_Agency', element: 'AgencyID' } }]
    AgencyID,
    _Agency.Name as AgencyName,
    @Search.defaultSearchElement: true
    @ObjectModel.text.element: ['CustomerName']
    @Consumption.valueHelpDefinition: [{ entity :{ name: '/DMO/I_Customer', element: 'CustomerID' } }]
    CustomerID,
    _Customer.LastName as CustomerName,
    BeginDate,
    EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    TotalPrice,
   @Consumption.valueHelpDefinition: [{ entity :{ name: 'I_Currency', element: 'Currency' } }]
    CurrencyCode,
    Description,
    TravelStatus,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    LocalLastChangedAt,
    /* Associations */
    //ZI_RAP_TRAVEL_YASH
    _Agency,
    _Booking : redirected to composition child ZC_RAP_BOOKING_YASH,
    _Currency,
    _Customer
}
