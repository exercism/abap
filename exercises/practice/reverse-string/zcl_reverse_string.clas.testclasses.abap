CLASS ltcl_reverse_string DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_reverse_string.

    METHODS:
      setup,
      test_empty_string FOR TESTING,
      test_word FOR TESTING,
      test_capitalized_word FOR TESTING,
      test_sentence_with_punctuation FOR TESTING,
      test_palindrome FOR TESTING,
      test_even_sized_word FOR TESTING.

ENDCLASS.

CLASS ltcl_reverse_string IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_reverse_string( ).
  ENDMETHOD.

  METHOD test_empty_string.
    cl_abap_unit_assert=>assert_equals(
      act = cut->reverse_string( '' )
      exp = '' ).
  ENDMETHOD.

  METHOD test_word.
    cl_abap_unit_assert=>assert_equals(
      act = cut->reverse_string( 'robot' )
      exp = 'tobor' ).
  ENDMETHOD.

  METHOD test_capitalized_word.
    cl_abap_unit_assert=>assert_equals(
      act = cut->reverse_string( 'Ramen' )
      exp = 'nemaR' ).
  ENDMETHOD.

  METHOD test_sentence_with_punctuation.
    cl_abap_unit_assert=>assert_equals(
      act = cut->reverse_string( `I'm hungry!` )
      exp = `!yrgnuh m'I` ).
  ENDMETHOD.

  METHOD test_palindrome.
    cl_abap_unit_assert=>assert_equals(
      act = cut->reverse_string( 'racecar' )
      exp = 'racecar' ).
  ENDMETHOD.

  METHOD test_even_sized_word.
    cl_abap_unit_assert=>assert_equals(
      act = cut->reverse_string( 'drawer' )
      exp = 'reward' ).
  ENDMETHOD.

ENDCLASS.
