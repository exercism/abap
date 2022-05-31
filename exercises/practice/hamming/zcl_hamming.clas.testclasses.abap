CLASS ltcl_hamming DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_hamming.
    METHODS setup.
    METHODS test_short_equal FOR TESTING RAISING cx_static_check.
    METHODS test_short_different FOR TESTING RAISING cx_static_check.
    METHODS test_long_equal FOR TESTING RAISING cx_static_check.
    METHODS test_long_different FOR TESTING RAISING cx_static_check.
    METHODS test_first_longer FOR TESTING RAISING cx_static_check.
    METHODS test_second_longer FOR TESTING RAISING cx_static_check.
    METHODS test_both_empty FOR TESTING RAISING cx_static_check.
    METHODS test_one_empty FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltcl_hamming IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_hamming( ).
  ENDMETHOD.

  METHOD test_short_equal.
    cl_abap_unit_assert=>assert_equals(
      act = cut->hamming_distance(
                first_strand  = 'A'
                second_strand = 'A' )
      exp = 0 ).
  ENDMETHOD.

  METHOD test_short_different.
    cl_abap_unit_assert=>assert_equals(
      act = cut->hamming_distance(
                first_strand  = 'A'
                second_strand = 'G' )
      exp = 1 ).
  ENDMETHOD.

  METHOD test_long_equal.
    cl_abap_unit_assert=>assert_equals(
      act = cut->hamming_distance(
                first_strand  = 'GACGACGTGCTAAAGATCCTG'
                second_strand = 'GACGACGTGCTAAAGATCCTG' )
      exp = 0 ).
  ENDMETHOD.

  METHOD test_long_different.
    cl_abap_unit_assert=>assert_equals(
      act = cut->hamming_distance(
                first_strand  = 'GGACGGATTCTG'
                second_strand = 'AGGACGGATTCT' )
      exp = 9 ).
  ENDMETHOD.

  METHOD test_first_longer.
    TRY.
        cut->hamming_distance(
          first_strand  = 'AACTATCG'
          second_strand = 'AACTATC' ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.

  METHOD test_second_longer.
    TRY.
        cut->hamming_distance(
          first_strand  = 'AACTAAC'
          second_strand = 'AACTAACT' ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.

  METHOD test_both_empty.
    cl_abap_unit_assert=>assert_equals(
      act = cut->hamming_distance(
                first_strand  = ''
                second_strand = '' )
      exp = 0 ).
  ENDMETHOD.

  METHOD test_one_empty.
    TRY.
        cut->hamming_distance(
          first_strand  = ''
          second_strand = 'CGT' ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.

ENDCLASS.
