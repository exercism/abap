CLASS ltcl_leap DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_leap.
    METHODS setup.
    METHODS test_2015 FOR TESTING.
    METHODS test_1970 FOR TESTING.
    METHODS test_1996 FOR TESTING.
    METHODS test_1960 FOR TESTING.
    METHODS test_2100 FOR TESTING.
    METHODS test_1900 FOR TESTING.
    METHODS test_2000 FOR TESTING.
    METHODS test_2400 FOR TESTING.
    METHODS test_1800 FOR TESTING.

ENDCLASS.

CLASS ltcl_leap IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_leap( ).
  ENDMETHOD.

  METHOD test_2015.
* year not divisible by 4 in common year
    cl_abap_unit_assert=>assert_equals(
      act = cut->leap( 2015 )
      exp = abap_false ).
  ENDMETHOD.

  METHOD test_1970.
* year divisible by 2, not divisible by 4 in common year
    cl_abap_unit_assert=>assert_equals(
      act = cut->leap( 1970 )
      exp = abap_false ).
  ENDMETHOD.

  METHOD test_1996.
* year divisible by 4, not divisible by 100 in leap year
    cl_abap_unit_assert=>assert_equals(
      act = cut->leap( 1996 )
      exp = abap_true ).
  ENDMETHOD.

  METHOD test_1960.
* year divisible by 4 and 5 is still a leap year
    cl_abap_unit_assert=>assert_equals(
      act = cut->leap( 1960 )
      exp = abap_true ).
  ENDMETHOD.

  METHOD test_2100.
* year divisible by 100, not divisible by 400 in common year
    cl_abap_unit_assert=>assert_equals(
      act = cut->leap( 2100 )
      exp = abap_false ).
  ENDMETHOD.

  METHOD test_1900.
* year divisible by 100 but not by 3 is still not a leap year
    cl_abap_unit_assert=>assert_equals(
      act = cut->leap( 1900 )
      exp = abap_false ).
  ENDMETHOD.

  METHOD test_2000.
* year divisible by 400 is leap year
    cl_abap_unit_assert=>assert_equals(
      act = cut->leap( 2000 )
      exp = abap_true ).
  ENDMETHOD.

  METHOD test_2400.
* year divisible by 400 but not by 125 is still a leap year
    cl_abap_unit_assert=>assert_equals(
      act = cut->leap( 2400 )
      exp = abap_true ).
  ENDMETHOD.

  METHOD test_1800.
* year divisible by 200, not divisible by 400 in common year
    cl_abap_unit_assert=>assert_equals(
      act = cut->leap( 1800 )
      exp = abap_false ).
  ENDMETHOD.

ENDCLASS.
