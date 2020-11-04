CLASS zcl_rap_eml_yash DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rap_eml_yash IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*  1. Step- Read
*    READ ENTITIES OF zi_rap_travel_yash
*    ENTITY Travel
*    FROM VALUE #( ( TravelUUID = '5A6C16F034468A4217000F027404E138' ) )
*    RESULT DATA(travels).

**  2. Step- Read with Fields
*    READ ENTITIES OF zi_rap_travel_yash
*    ENTITY Travel
*    FIELDS ( AgencyID CustomerID  )
*    WITH VALUE #( ( TravelUUID = '5A6C16F034468A4217000F027404E138' ) )
*    RESULT DATA(travels).

**  3. Step- Read with All Fields
*    READ ENTITIES OF zi_rap_travel_yash
*    ENTITY Travel
*    ALL FIELDS
*    WITH VALUE #( ( TravelUUID = '5A6C16F034468A4217000F027404E138' ) )
*    RESULT DATA(travels).
*  4. Step- Read with Association
*    READ ENTITIES OF zi_rap_travel_yash
*    ENTITY Travel BY \_Booking
*    ALL FIELDS
*    WITH VALUE #( ( TravelUUID = '5A6C16F034468A4217000F027404E138' ) )
*    RESULT DATA(travels).

**  4. Unsuccessful Read
*    READ ENTITIES OF zi_rap_travel_yash
*    ENTITY Travel
*    ALL FIELDS
*    WITH VALUE #( ( TravelUUID = '5A6C16F034468A4217000F027404E138' ) )
*    RESULT DATA(travels)
*    FAILED DATA(fail)
*    REPORTED DATA(reported).
*    out->write( fail ).
*    out->write( reported ).
*    out->write( travels ).

**  5. Modify Read
*    MODIFY ENTITIES OF zi_rap_travel_yash
*    ENTITY Travel
*    UPDATE  SET FIELDS WITH VALUE #( ( TravelUUID = '216D16F034468A4217000F027404E138' Description = 'Modify Records' ) )
*    FAILED DATA(fail)
*    REPORTED DATA(reported).
*    COMMIT ENTITIES RESPONSE OF zi_rap_travel_yash
*    FAILED DATA(fail_commit)
*    REPORTED DATA(report_commit).
*    out->write( 'Update Done' ).

**  6. Modify Create
*    MODIFY ENTITIES OF zi_rap_travel_yash
*    ENTITY Travel
*    CREATE
*    SET FIELDS WITH VALUE #( ( %cid = 'My Content ID' AgencyID = '70012' CustomerID = '70'
*                                BeginDate = cl_abap_context_info=>get_system_date( )
*                                EndDate = cl_abap_context_info=>get_system_date( ) + 10
*                                Description = 'Create Record' ) )
*    MAPPED DATA(mapped)
*    FAILED DATA(fail)
*    REPORTED DATA(reported).
*    out->write( mapped-travel ).
*    COMMIT ENTITIES RESPONSE OF zi_rap_travel_yash
*    FAILED DATA(fail_commit)
*    REPORTED DATA(report_commit).
*    out->write( 'Create Done' ).

*  6. Modify Create
    MODIFY ENTITIES OF zi_rap_travel_yash
    ENTITY Travel
    DELETE FROM
    VALUE #( ( TravelUUID = '127E848FA9751EEB87BE12336D2E1A7D') )
    FAILED DATA(fail)
    REPORTED DATA(reported).

    COMMIT ENTITIES RESPONSE OF zi_rap_travel_yash
    FAILED DATA(fail_commit)
    REPORTED DATA(report_commit).
    out->write( 'Delete Done' ).

  ENDMETHOD.

ENDCLASS.
