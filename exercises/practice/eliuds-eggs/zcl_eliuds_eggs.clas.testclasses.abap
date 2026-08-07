*"* use this source file for your ABAP unit test classes
CLASS ltcl_eliuds_eggs DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_eliuds_eggs.
    METHODS setup.
    METHODS:
      test_0_eggs FOR TESTING,
      test_1_egg FOR TESTING,
      test_4_eggs FOR TESTING,
      test_13_eggs FOR TESTING.
ENDCLASS.


CLASS ltcl_eliuds_eggs IMPLEMENTATION.
  METHOD setup.
    cut = NEW zcl_eliuds_eggs( ).
  ENDMETHOD.

  METHOD test_0_eggs.
    cl_abap_unit_assert=>assert_equals(
      exp = 0
      act = cut->egg_count( 0 ) ).
  ENDMETHOD.

  METHOD test_1_egg.
    cl_abap_unit_assert=>assert_equals(
      exp = 1
      act = cut->egg_count( 16 ) ).
  ENDMETHOD.

  METHOD test_4_eggs.
    cl_abap_unit_assert=>assert_equals(
      exp = 4
      act = cut->egg_count( 89 ) ).
  ENDMETHOD.

  METHOD test_13_eggs.
    cl_abap_unit_assert=>assert_equals(
      exp = 13
      act = cut->egg_count( 2000000000 ) ).
  ENDMETHOD.

ENDCLASS.
