@EndUserText.label: 'Booking BO Projection View'
@AccessControl.authorizationCheck: #CHECK

@Search.searchable: true
@Metadata.allowExtensions: true
define view entity ZC_RAP_BOOKING_YASH 
as projection on ZI_RAP_BOOKING_YASH as Booking
{
    //ZI_RAP_BOOKING_YASH
    key BookingUUID,
    @Search.defaultSearchElement: true
    TravelUUID,
    BookingID,
    BookingDate,
    @Search.defaultSearchElement: true
    @ObjectModel.text.element: ['CustomerName']
    @Consumption.valueHelpDefinition: [{ entity :{ name: '/DMO/I_Customer', element: 'CustomerID' } }]    
    CustomerID,
    _Customer.LastName as CustomerName,
    @ObjectModel.text.element: ['CarrierName'] //Display Name of Agency while searching
    @Consumption.valueHelpDefinition: [{ entity :{ name: '/DMO/I_Carrier', element: 'AirlineID' } }]
    CarrierID,
    _Carrier.Name as CarrierName,
    @Consumption.valueHelpDefinition: [{ entity :{ name: '/DMO/I_Flight', element: 'ConnectionID' },
                                          additionalBinding: [ { localElement: 'CarrierID',element: 'AirlineID' },
                                                               { localElement: 'FlightDate',element: 'FlightDate', usage: #RESULT },
                                                               { localElement: 'FlightPrice',element: 'Price' , usage: #RESULT },
                                                               { localElement: 'CurrencyCode',element: 'CurrencyCode' , usage: #RESULT } ] }]    
    ConnectionID,
    FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    FlightPrice,
    @Consumption.valueHelpDefinition: [{ entity :{ name: 'I_Currency' ,element: 'Currency'} }]
    CurrencyCode,
    CreatedBy,
    LastChangedBy,
    LocalLastChangedAt,
    /* Associations */
    //ZI_RAP_BOOKING_YASH
    _Carrier,
    _Connection,
    _Currency,
    _Customer,
    _Flight,
    _Travel: redirected to parent ZC_RAP_TRAVEL_YASH
}
