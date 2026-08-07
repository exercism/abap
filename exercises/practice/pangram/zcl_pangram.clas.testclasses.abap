CLASS ltcl_pangram DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_pangram.
    METHODS setup.
    METHODS test_empty_sentence FOR TESTING RAISING cx_static_check.
    METHODS test_perfect_lower_case FOR TESTING RAISING cx_static_check.
    METHODS test_only_lower_case FOR TESTING RAISING cx_static_check.
    METHODS test_missing_letter_x FOR TESTING RAISING cx_static_check.
    METHODS test_missing_letter_h FOR TESTING RAISING cx_static_check.
    METHODS test_with_underscores FOR TESTING RAISING cx_static_check.
    METHODS test_with_numbers FOR TESTING RAISING cx_static_check.
    METHODS test_numbers_replace_letters FOR TESTING RAISING cx_static_check.
    METHODS test_mixed_case_punctuation FOR TESTING RAISING cx_static_check.
    METHODS test_a_m_is_not_pangram FOR TESTING RAISING cx_static_check.

ENDCLASS.


CLASS ltcl_pangram IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_pangram( ).
  ENDMETHOD.

  METHOD test_empty_sentence.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_pangram( '' )
      exp = abap_false ).
  ENDMETHOD.

  METHOD test_perfect_lower_case.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_pangram( 'abcdefghijklmnopqrstuvwxyz' )
      exp = abap_true ).
  ENDMETHOD.

  METHOD test_only_lower_case.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_pangram( 'the quick brown fox jumps over the lazy dog' )
      exp = abap_true ).
  ENDMETHOD.

  METHOD test_missing_letter_x.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_pangram( 'a quick movement of the enemy will jeopardize five gunboats' )
      exp = abap_false ).
  ENDMETHOD.

  METHOD test_missing_letter_h.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_pangram( 'five boxing wizards jump quickly at it' )
      exp = abap_false ).
  ENDMETHOD.

  METHOD test_with_underscores.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_pangram( 'the_quick_brown_fox_jumps_over_the_lazy_dog' )
      exp = abap_true ).
  ENDMETHOD.

  METHOD test_with_numbers.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_pangram( 'the 1 quick brown fox jumps over the 2 lazy dogs' )
      exp = abap_true ).
  ENDMETHOD.

  METHOD test_numbers_replace_letters.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_pangram( '7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog' )
      exp = abap_false ).
  ENDMETHOD.

  METHOD test_mixed_case_punctuation.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_pangram( '"Five quacking Zephyrs jolt my wax bed."' )
      exp = abap_true ).
  ENDMETHOD.

  METHOD test_a_m_is_not_pangram.
    cl_abap_unit_assert=>assert_equals(
      act = cut->is_pangram( 'abcdefghijklm ABCDEFGHIJKLM' )
      exp = abap_false ).
  ENDMETHOD.


ENDCLASS.
