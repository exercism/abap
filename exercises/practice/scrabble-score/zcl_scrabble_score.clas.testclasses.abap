CLASS ltcl_scrabble_score DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS FINAL.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_scrabble_score.
    METHODS setup.
    METHODS test_lowercase_letter FOR TESTING RAISING cx_static_check.
    METHODS test_uppercase_letter FOR TESTING RAISING cx_static_check.
    METHODS test_valuable_letter FOR TESTING RAISING cx_static_check.
    METHODS test_short_word FOR TESTING RAISING cx_static_check.
    METHODS test_short_valuable_word FOR TESTING RAISING cx_static_check.
    METHODS test_medium_word FOR TESTING RAISING cx_static_check.
    METHODS test_medium_valuable_word FOR TESTING RAISING cx_static_check.
    METHODS test_long_mixed_case_word FOR TESTING RAISING cx_static_check.
    METHODS test_english_like_word FOR TESTING RAISING cx_static_check.
    METHODS test_empty_input FOR TESTING RAISING cx_static_check.
    METHODS test_entire_alphabet_available FOR TESTING RAISING cx_static_check.



ENDCLASS.

CLASS ltcl_scrabble_score IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_scrabble_score( ).
  ENDMETHOD.

  " lowercase letter
  METHOD test_lowercase_letter.
    cl_abap_unit_assert=>assert_equals(
      act = cut->score( 'a' )
      exp = 1 ).
  ENDMETHOD.

  " uppercase letter
  METHOD test_uppercase_letter.
    cl_abap_unit_assert=>assert_equals(
      act = cut->score( 'A' )
      exp = 1 ).
  ENDMETHOD.

  " valuable letter
  METHOD test_valuable_letter.
    cl_abap_unit_assert=>assert_equals(
      act = cut->score( 'f' )
      exp = 4 ).
  ENDMETHOD.

  " short word
  METHOD test_short_word.
    cl_abap_unit_assert=>assert_equals(
      act = cut->score( 'at' )
      exp = 2 ).
  ENDMETHOD.

  " short, valuable word
  METHOD test_short_valuable_word.
    cl_abap_unit_assert=>assert_equals(
      act = cut->score( 'zoo' )
      exp = 12 ).
  ENDMETHOD.

  " medium word
  METHOD test_medium_word.
    cl_abap_unit_assert=>assert_equals(
      act = cut->score( 'street' )
      exp = 6 ).
  ENDMETHOD.

  " medium, valuable word
  METHOD test_medium_valuable_word.
    cl_abap_unit_assert=>assert_equals(
      act = cut->score( 'quirky' )
      exp = 22 ).
  ENDMETHOD.

  " long, mixed-case word
  METHOD test_long_mixed_case_word.
    cl_abap_unit_assert=>assert_equals(
      act = cut->score( 'OxyphenButazone' )
      exp = 41 ).
  ENDMETHOD.

  " english-like word
  METHOD test_english_like_word.
    cl_abap_unit_assert=>assert_equals(
      act = cut->score( 'pinata' )
      exp = 8 ).
  ENDMETHOD.

  " empty input
  METHOD test_empty_input.
    cl_abap_unit_assert=>assert_equals(
      act = cut->score( '' )
      exp = 0 ).
  ENDMETHOD.

  " entire alphabet available
  METHOD test_entire_alphabet_available.
    cl_abap_unit_assert=>assert_equals(
      act = cut->score( 'abcdefghijklmnopqrstuvwxyz' )
      exp = 87 ).
  ENDMETHOD.


ENDCLASS.
