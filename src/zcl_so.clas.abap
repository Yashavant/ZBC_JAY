CLASS zcl_so DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS: get_data.
ENDCLASS.



CLASS ZCL_SO IMPLEMENTATION.


  METHOD get_data.
    SELECT *
    FROM zsd_order
    INTO TABLE @DATA(lt_so).
    IF lt_so IS NOT INITIAL.

    ENDIF.
  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
    DATA: it_so TYPE STANDARD TABLE OF zsd_order.
    it_so = VALUE #( ( vbeln = '3' erdat = sy-datum werks = '1000') ).

    DATA(lv_str) =  'This is first line'.

    MODIFY zsd_order FROM TABLE @it_so.
    commit WORK.
  ENDMETHOD.
ENDCLASS.
