CLASS ltcl_crypto_square DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_crypto_square.
    METHODS setup.
    METHODS:
      test_blank FOR TESTING,
      test_normalization FOR TESTING,
      test_single_lowercase FOR TESTING,
      test_single_lowercase_w_space FOR TESTING,
      test_punctuation_w_number FOR TESTING,
      test_9char_3by3 FOR TESTING,
      test_8char_3by3 FOR TESTING,
      test_54char_7by8 FOR TESTING.
ENDCLASS.


CLASS ltcl_crypto_square IMPLEMENTATION.
  METHOD setup.
    cut = NEW zcl_crypto_square( ).
  ENDMETHOD.

  METHOD test_blank.
    cl_abap_unit_assert=>assert_equals(
      exp = ``
      act = cut->encode( `` ) ).
  ENDMETHOD.

  METHOD test_normalization.
    cl_abap_unit_assert=>assert_equals(
      exp = ``
      act = cut->encode( `...---...` ) ).
  ENDMETHOD.

  METHOD test_single_lowercase.
    cl_abap_unit_assert=>assert_equals(
      exp = `z`
      act = cut->encode( `Z` ) ).
  ENDMETHOD.

  METHOD test_single_lowercase_w_space.
    cl_abap_unit_assert=>assert_equals(
      exp = `u`
      act = cut->encode( ` U ` ) ).
  ENDMETHOD.

  METHOD test_punctuation_w_number.
    cl_abap_unit_assert=>assert_equals(
      exp = `1`
      act = cut->encode( ` @1,%! ` ) ).
  ENDMETHOD.

  METHOD test_9char_3by3.
    cl_abap_unit_assert=>assert_equals(
      exp = `tsf hiu isn`
      act = cut->encode( `This is fun!` ) ).
  ENDMETHOD.

  METHOD test_8char_3by3.
    cl_abap_unit_assert=>assert_equals(
      exp = `tso rtu uy `
      act = cut->encode( `Trust you` ) ).
  ENDMETHOD.

  METHOD test_54char_7by8.
    DATA(inp_string) = `If man was meant to stay on the ground, god would have given us roots.`.
    DATA(exp_string) = `imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau `.
    cl_abap_unit_assert=>assert_equals(
      exp = exp_string
      act = cut->encode( inp_string ) ).
  ENDMETHOD.
ENDCLASS.