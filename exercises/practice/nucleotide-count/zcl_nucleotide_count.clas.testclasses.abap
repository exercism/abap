CLASS ltcl_nucleotide_count DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_nucleotide_count.
    METHODS setup.
    METHODS test_empty_strand FOR TESTING RAISING cx_static_check.
    METHODS test_single_character FOR TESTING RAISING cx_static_check.
    METHODS test_repeated_nucleotide FOR TESTING RAISING cx_static_check.
    METHODS test_multiple_nucleotides FOR TESTING RAISING cx_static_check.
    METHODS test_invalid_nucleotide FOR TESTING.

ENDCLASS.


CLASS ltcl_nucleotide_count IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_nucleotide_count( ).
  ENDMETHOD.

  METHOD test_empty_strand.
    cl_abap_unit_assert=>assert_equals(
      act = cut->nucleotide_counts( '' )
      exp = VALUE zcl_nucleotide_count=>nucleotide_counts(
        ( nucleotide = 'A' count = 0 )
        ( nucleotide = 'C' count = 0 )
        ( nucleotide = 'G' count = 0 )
        ( nucleotide = 'T' count = 0 ) ) ).
  ENDMETHOD.

  METHOD test_single_character.
    cl_abap_unit_assert=>assert_equals(
      act = cut->nucleotide_counts( 'G' )
      exp = VALUE zcl_nucleotide_count=>nucleotide_counts(
        ( nucleotide = 'A' count = 0 )
        ( nucleotide = 'C' count = 0 )
        ( nucleotide = 'G' count = 1 )
        ( nucleotide = 'T' count = 0 ) ) ).
  ENDMETHOD.

  METHOD test_repeated_nucleotide.
    cl_abap_unit_assert=>assert_equals(
      act = cut->nucleotide_counts( 'GGGGGGG' )
      exp = VALUE zcl_nucleotide_count=>nucleotide_counts(
        ( nucleotide = 'A' count = 0 )
        ( nucleotide = 'C' count = 0 )
        ( nucleotide = 'G' count = 7 )
        ( nucleotide = 'T' count = 0 ) ) ).
  ENDMETHOD.

  METHOD test_multiple_nucleotides.
    cl_abap_unit_assert=>assert_equals(
      act = cut->nucleotide_counts( 'AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC' )
      exp = VALUE zcl_nucleotide_count=>nucleotide_counts(
        ( nucleotide = 'A' count = 20 )
        ( nucleotide = 'C' count = 12 )
        ( nucleotide = 'G' count = 17 )
        ( nucleotide = 'T' count = 21 ) ) ).
  ENDMETHOD.

  METHOD test_invalid_nucleotide.
    TRY.
        cut->nucleotide_counts( 'AGXXACT' ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.


ENDCLASS.
