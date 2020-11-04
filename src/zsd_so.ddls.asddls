@AbapCatalog.sqlViewName: 'ZSDSO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales Order'
define view ZSD_SO as select from zsd_order {
    //zsd_order
    @UI.facet: [ {
        purpose:  #STANDARD,
        type:     #IDENTIFICATION_REFERENCE,
        label:    'Order',
        position: 10 } ]
     @UI.lineItem: [ { position: 10 , label: 'Order' } ]
     @UI: { identification:[ { position: 10, label: 'Order' } ] }
     @UI.selectionField: [ { position: 10 } ]
    key vbeln,
     @UI.lineItem: [ { position: 20 , label: 'Created On'  } ]
     @UI: { identification:[ { position: 20, label: 'Created On' } ] }
    erdat,
     @UI.lineItem: [ { position: 30 , label: 'Plant'  } ]
     @UI: { identification:[ { position: 30, label: 'Plant' } ] }
    werks
    
}
