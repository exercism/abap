CLASS ltcl_two_fer DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_two_fer.
    METHODS setup.
    METHODS test_empty FOR TESTING RAISING cx_static_check.
    METHODS test_alice FOR TESTING RAISING cx_static_check.
    METHODS test_bob FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltcl_two_fer IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_two_fer( ).
  ENDMETHOD.

  METHOD test_empty.
    cl_abap_unit_assert=>assert_equals(
      act = cut->two_fer( )
      exp = 'One for you, one for me.' ).
  ENDMETHOD.

  METHOD test_alice.
    cl_abap_unit_assert=>assert_equals(
      act = cut->two_fer( 'Alice' )
      exp = 'One for Alice, one for me.' ).
  ENDMETHOD.

  METHOD test_bob.
    cl_abap_unit_assert=>assert_equals(
      act = cut->two_fer( 'Bob' )
      exp = 'One for Bob, one for me.' ).
  ENDMETHOD.

ENDCLASS.