CLASS ltcl_nth_prime DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS FINAL.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_nth_prime.
    METHODS setup.
    METHODS test_first_prime FOR TESTING RAISING cx_static_check.
    METHODS test_second_prime FOR TESTING RAISING cx_static_check.
    METHODS test_sixth_prime FOR TESTING RAISING cx_static_check.
    METHODS test_big_prime FOR TESTING RAISING cx_static_check.
    METHODS test_no_zeroth_prime FOR TESTING RAISING cx_static_check.



ENDCLASS.

CLASS ltcl_nth_prime IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_nth_prime( ).
  ENDMETHOD.

  "first prime
  METHOD test_first_prime.
    cl_abap_unit_assert=>assert_equals(
      act = cut->prime( 1 )
      exp = 2 ).
  ENDMETHOD.

  "second prime
  METHOD test_second_prime.
    cl_abap_unit_assert=>assert_equals(
      act = cut->prime( 2 )
      exp = 3 ).
  ENDMETHOD.

  "sixth prime
  METHOD test_sixth_prime.
    cl_abap_unit_assert=>assert_equals(
      act = cut->prime( 6 )
      exp = 13 ).
  ENDMETHOD.

  "big prime
  METHOD test_big_prime.
    cl_abap_unit_assert=>assert_equals(
      act = cut->prime( 36 )
      exp = 151 ).
  ENDMETHOD.

  "there is no zeroth prime
  METHOD test_no_zeroth_prime.
    TRY.
        cut->prime( 0 ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.


ENDCLASS.