CLASS ltcl_prime_factor DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS FINAL.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_prime_factors.
    METHODS setup.
    METHODS test_no_factors FOR TESTING RAISING cx_static_check.
    METHODS test_prime_number FOR TESTING RAISING cx_static_check.
    METHODS test_another_prime_number FOR TESTING RAISING cx_static_check.
    METHODS test_square_of_a_prime FOR TESTING RAISING cx_static_check.
    METHODS test_product_of_first_prime FOR TESTING RAISING cx_static_check.
    METHODS test_cube_of_a_prime FOR TESTING RAISING cx_static_check.
    METHODS test_product_of_second_prime FOR TESTING RAISING cx_static_check.
    METHODS test_product_of_third_prime FOR TESTING RAISING cx_static_check.
    METHODS test_product_first_sec_prime FOR TESTING RAISING cx_static_check.
    METHODS test_product_primes_non_prime FOR TESTING RAISING cx_static_check.
    METHODS test_product_of_primes FOR TESTING RAISING cx_static_check.
    METHODS test_factors_large_prime FOR TESTING RAISING cx_static_check.



ENDCLASS.

CLASS ltcl_prime_factor IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_prime_factors( ).
  ENDMETHOD.

  "no factors
  METHOD test_no_factors.
    DATA(expected_value) = VALUE zcl_prime_factors=>integertab( ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->factors( 1 )
      exp = expected_value ).
  ENDMETHOD.

  "prime number
  METHOD test_prime_number.
    DATA(expected_value) = VALUE zcl_prime_factors=>integertab( ( 2 ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->factors( 2 )
      exp = expected_value ).
  ENDMETHOD.

  "another prime number
  METHOD test_another_prime_number.
    DATA(expected_value) = VALUE zcl_prime_factors=>integertab( ( 3 ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->factors( 3 )
      exp = expected_value ).
  ENDMETHOD.

  "square of a prime
  METHOD test_square_of_a_prime.
    DATA(expected_value) = VALUE zcl_prime_factors=>integertab( ( 3 ) ( 3 ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->factors( 9 )
      exp = expected_value ).
  ENDMETHOD.

  "product of first prime
  METHOD test_product_of_first_prime.
    DATA(expected_value) = VALUE zcl_prime_factors=>integertab( ( 2 ) ( 2 ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->factors( 4 )
      exp = expected_value ).
  ENDMETHOD.

  "cube of a prime
  METHOD test_cube_of_a_prime.
    DATA(expected_value) = VALUE zcl_prime_factors=>integertab( ( 2 ) ( 2 ) ( 2 ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->factors( 8 )
      exp = expected_value ).
  ENDMETHOD.

  "product of second prime
  METHOD test_product_of_second_prime.
    DATA(expected_value) = VALUE zcl_prime_factors=>integertab( ( 3 ) ( 3 ) ( 3 ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->factors( 27 )
      exp = expected_value ).
  ENDMETHOD.

  "product of third prime
  METHOD test_product_of_third_prime.
    DATA(expected_value) = VALUE zcl_prime_factors=>integertab( ( 5 ) ( 5 ) ( 5 ) ( 5 ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->factors( 625 )
      exp = expected_value ).
  ENDMETHOD.

"product of first and second prime
  METHOD test_product_first_sec_prime.
    DATA(expected_value) = VALUE zcl_prime_factors=>integertab( ( 2 ) ( 3 ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->factors( 6 )
      exp = expected_value ).
  ENDMETHOD.

"product of primes and non-prime
  METHOD test_product_primes_non_prime.
    DATA(expected_value) = VALUE zcl_prime_factors=>integertab( ( 2 ) ( 2 ) ( 3 ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->factors( 12 )
      exp = expected_value ).
  ENDMETHOD.

"product of primes
  METHOD test_product_of_primes.
    DATA(expected_value) = VALUE zcl_prime_factors=>integertab( ( 5 ) ( 17 ) ( 23 ) ( 461 ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->factors( 901255 )
      exp = expected_value ).
  ENDMETHOD.

"factors include a large prime
  METHOD test_factors_large_prime.
    DATA(expected_value) = VALUE zcl_prime_factors=>integertab( ( 11 ) ( 9539 ) ( 894119 ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->factors( 93819012551 )
      exp = expected_value ).
  ENDMETHOD.

ENDCLASS.