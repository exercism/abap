CLASS ltcl_isbn_verifier DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_isbn_verifier.
    METHODS setup.
    METHODS test_valid_isbn FOR TESTING RAISING cx_static_check.
    METHODS test_invalid_check_digit FOR TESTING RAISING cx_static_check.
    METHODS test_valid_x_check_digit FOR TESTING RAISING cx_static_check.
    METHODS test_check_digit_not_x FOR TESTING RAISING cx_static_check.
    METHODS test_invalid_check_not_zero FOR TESTING RAISING cx_static_check.
    METHODS test_invalid_char_not_zero FOR TESTING RAISING cx_static_check.
    METHODS test_x_only_check_digit FOR TESTING RAISING cx_static_check.
    METHODS test_one_check_digit_allowed FOR TESTING RAISING cx_static_check.
    METHODS test_x_not_substituted FOR TESTING RAISING cx_static_check.
    METHODS test_valid_without_dashes FOR TESTING RAISING cx_static_check.
    METHODS test_without_dashes_x FOR TESTING RAISING cx_static_check.
    METHODS test_missing_check_no_dashes FOR TESTING RAISING cx_static_check.
    METHODS test_too_long_no_dashes FOR TESTING RAISING cx_static_check.
    METHODS test_too_short FOR TESTING RAISING cx_static_check.
    METHODS test_missing_check_digit FOR TESTING RAISING cx_static_check.
    METHODS test_x_not_for_zero FOR TESTING RAISING cx_static_check.
    METHODS test_empty_isbn FOR TESTING RAISING cx_static_check.
    METHODS test_nine_characters FOR TESTING RAISING cx_static_check.
    METHODS test_invalid_after_length FOR TESTING RAISING cx_static_check.
    METHODS test_invalid_before_length FOR TESTING RAISING cx_static_check.
    METHODS test_too_long_contains_valid FOR TESTING RAISING cx_static_check.

ENDCLASS.


CLASS ltcl_isbn_verifier IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_isbn_verifier( ).
  ENDMETHOD.

  METHOD test_valid_isbn.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_valid( '3-598-21508-8' )
      exp = abap_true ).
  ENDMETHOD.

  METHOD test_invalid_check_digit.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_valid( '3-598-21508-9' )
      exp = abap_false ).
  ENDMETHOD.

  METHOD test_valid_x_check_digit.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_valid( '3-598-21507-X' )
      exp = abap_true ).
  ENDMETHOD.

  METHOD test_check_digit_not_x.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_valid( '3-598-21507-A' )
      exp = abap_false ).
  ENDMETHOD.

  METHOD test_invalid_check_not_zero.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_valid( '4-598-21507-B' )
      exp = abap_false ).
  ENDMETHOD.

  METHOD test_invalid_char_not_zero.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_valid( '3-598-P1581-X' )
      exp = abap_false ).
  ENDMETHOD.

  METHOD test_x_only_check_digit.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_valid( '3-598-2X507-9' )
      exp = abap_false ).
  ENDMETHOD.

  METHOD test_one_check_digit_allowed.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_valid( '3-598-21508-96' )
      exp = abap_false ).
  ENDMETHOD.

  METHOD test_x_not_substituted.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_valid( '3-598-2X507-5' )
      exp = abap_false ).
  ENDMETHOD.

  METHOD test_valid_without_dashes.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_valid( '3598215088' )
      exp = abap_true ).
  ENDMETHOD.

  METHOD test_without_dashes_x.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_valid( '359821507X' )
      exp = abap_true ).
  ENDMETHOD.

  METHOD test_missing_check_no_dashes.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_valid( '359821507' )
      exp = abap_false ).
  ENDMETHOD.

  METHOD test_too_long_no_dashes.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_valid( '3598215078X' )
      exp = abap_false ).
  ENDMETHOD.

  METHOD test_too_short.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_valid( '00' )
      exp = abap_false ).
  ENDMETHOD.

  METHOD test_missing_check_digit.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_valid( '3-598-21507' )
      exp = abap_false ).
  ENDMETHOD.

  METHOD test_x_not_for_zero.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_valid( '3-598-21515-X' )
      exp = abap_false ).
  ENDMETHOD.

  METHOD test_empty_isbn.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_valid( '' )
      exp = abap_false ).
  ENDMETHOD.

  METHOD test_nine_characters.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_valid( '134456729' )
      exp = abap_false ).
  ENDMETHOD.

  METHOD test_invalid_after_length.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_valid( '3132P34035' )
      exp = abap_false ).
  ENDMETHOD.

  METHOD test_invalid_before_length.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_valid( '3598P215088' )
      exp = abap_false ).
  ENDMETHOD.

  METHOD test_too_long_contains_valid.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_valid( '98245726788' )
      exp = abap_false ).
  ENDMETHOD.


ENDCLASS.
