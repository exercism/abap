CLASS ltcl_phone_number DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.

  PRIVATE SECTION.

    DATA cut TYPE REF TO zcl_phone_number.
    METHODS setup.
    METHODS test_clean_number FOR TESTING RAISING cx_static_check.
    METHODS test_clean_number_dots FOR TESTING RAISING cx_static_check.
    METHODS test_clean_number_spaces FOR TESTING RAISING cx_static_check.
    METHODS test_fail_nine_digits FOR TESTING RAISING cx_static_check.
    METHODS test_fail_11_digits_not_1 FOR TESTING RAISING cx_static_check.
    METHODS test_valid_11_digits_1 FOR TESTING RAISING cx_static_check.
    METHODS test_valid_11_digits_punct FOR TESTING RAISING cx_static_check.
    METHODS test_fail_more_11_digits FOR TESTING RAISING cx_static_check.
    METHODS test_fail_letters FOR TESTING RAISING cx_static_check.
    METHODS test_fail_punctuations FOR TESTING RAISING cx_static_check.
    METHODS test_fail_areacode_0 FOR TESTING RAISING cx_static_check.
    METHODS test_fail_areacode_1 FOR TESTING RAISING cx_static_check.
    METHODS test_fail_exchangecode_0 FOR TESTING RAISING cx_static_check.
    METHODS test_fail_exchangecode_1 FOR TESTING RAISING cx_static_check.
    METHODS test_fail_areacode_0_11 FOR TESTING RAISING cx_static_check.
    METHODS test_fail_areacode_1_11 FOR TESTING RAISING cx_static_check.
    METHODS test_fail_exchangecode_0_11 FOR TESTING RAISING cx_static_check.
    METHODS test_fail_exchangecode_1_11 FOR TESTING RAISING cx_static_check.


ENDCLASS.

CLASS ltcl_phone_number IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_phone_number( ).
  ENDMETHOD.

  " cleans the number
  METHOD test_clean_number.
    cl_abap_unit_assert=>assert_equals(
        act = cut->clean( '(223) 456-7890' )
        exp = '2234567890' ).
  ENDMETHOD.

  "cleans numbers with dots
  METHOD test_clean_number_dots.
    cl_abap_unit_assert=>assert_equals(
        act = cut->clean( '223.456.7890' )
        exp = '2234567890' ).
  ENDMETHOD.

  "cleans numbers with multiple spaces
  METHOD test_clean_number_spaces.
    cl_abap_unit_assert=>assert_equals(
        act = cut->clean( '223 456   7890   ' )
        exp = '2234567890' ).
  ENDMETHOD.

  "invalid when 9 digits
  METHOD test_fail_nine_digits.
    TRY.
        cut->clean( '123456789' ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.

  "invalid when 11 digits does not start with a 1
  METHOD test_fail_11_digits_not_1.
    TRY.
        cut->clean( '22234567890' ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.

  "valid when 11 digits and starting with 1
  METHOD test_valid_11_digits_1.
    cl_abap_unit_assert=>assert_equals(
        act = cut->clean( '12234567890' )
        exp = '2234567890' ).
  ENDMETHOD.

  "valid when 11 digits and starting with 1 even with punctuation
  METHOD test_valid_11_digits_punct.
    cl_abap_unit_assert=>assert_equals(
        act = cut->clean( '+1 (223) 456-7890' )
        exp = '2234567890' ).
  ENDMETHOD.

  "invalid when more than 11 digits
  METHOD test_fail_more_11_digits.
    TRY.
        cut->clean( '321234567890' ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.

  "invalid with letters
  METHOD test_fail_letters.
    TRY.
        cut->clean( '123-abc-7890' ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.

  "invalid with punctuations
  METHOD test_fail_punctuations.
    TRY.
        cut->clean( '123-@:!-7890' ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.

  "invalid if area code starts with 0
  METHOD test_fail_areacode_0.
    TRY.
        cut->clean( '(023) 456-7890' ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.

  "invalid if area code starts with 1
  METHOD test_fail_areacode_1.
    TRY.
        cut->clean( '(123) 456-7890' ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.

  "invalid if exchange code starts with 0
  METHOD test_fail_exchangecode_0.
    TRY.
        cut->clean( '(223) 056-7890' ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.

  "invalid if exchange code starts with 1
  METHOD test_fail_exchangecode_1.
    TRY.
        cut->clean( '(223) 156-7890' ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.

  "invalid if area code starts with 0 on valid 11-digit number
  METHOD test_fail_areacode_0_11.
    TRY.
        cut->clean( '1 (023) 456-7890' ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.

  "invalid if area code starts with 1 on valid 11-digit number
  METHOD test_fail_areacode_1_11.
    TRY.
        cut->clean( '1 (123) 456-7890' ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.

  "invalid if exchange code starts with 0 on valid 11-digit number
  METHOD test_fail_exchangecode_0_11.
    TRY.
        cut->clean( '1 (223) 056-7890' ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.

  "invalid if exchange code starts with 1 on valid 11-digit number
  METHOD test_fail_exchangecode_1_11.
    TRY.
        cut->clean( '1 (223) 156-7890' ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.

ENDCLASS.