CLASS ltcl_test DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS FINAL.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_resistor_color.
    METHODS setup.
    METHODS test_black FOR TESTING.
    METHODS test_white FOR TESTING.
    METHODS test_orange FOR TESTING.

ENDCLASS.


CLASS ltcl_test IMPLEMENTATION.

  METHOD setup.
    cut = NEW #( ).
  ENDMETHOD.

  METHOD test_black.
    cl_abap_unit_assert=>assert_equals(
      act = cut->resistor_color( 'black' )
      exp = 0 ).
  ENDMETHOD.

  METHOD test_white.
    cl_abap_unit_assert=>assert_equals(
      act = cut->resistor_color( 'white' )
      exp = 9 ).
  ENDMETHOD.

  METHOD test_orange.
    cl_abap_unit_assert=>assert_equals(
      act = cut->resistor_color( 'orange' )
      exp = 3 ).
  ENDMETHOD.

ENDCLASS.