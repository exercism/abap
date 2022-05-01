CLASS ltcl_hello_world DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.
  PRIVATE SECTION.
    METHODS test FOR TESTING RAISING cx_static_check.
ENDCLASS.

CLASS ltcl_hello_world IMPLEMENTATION.

  METHOD test.
    cl_abap_unit_assert=>assert_equals(
      act = NEW zcl_hello_world( )->hello( )
      exp = 'Hello, World!' ).
  ENDMETHOD.

ENDCLASS.
