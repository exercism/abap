*"* use this source file for your ABAP unit test classes
CLASS ltcl_rna_transcription DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_rna_transcription.
    METHODS setup.
    METHODS:
      empty_rna_sequence             FOR TESTING,
      rna_cmp_of_cytosine_is_guanine FOR TESTING,
      rna_cmp_of_guanine_is_cytosine FOR TESTING,
      rna_cmp_of_thymine_is_adenine  FOR TESTING,
      rna_cmp_of_adenine_is_uracil   FOR TESTING,
      rna_complement                 FOR TESTING.
ENDCLASS.


CLASS ltcl_rna_transcription IMPLEMENTATION.
  METHOD setup.
    cut = NEW zcl_rna_transcription( ).
  ENDMETHOD.

  METHOD empty_rna_sequence.
    cl_abap_unit_assert=>assert_equals(
      exp = ''
      act = cut->transcribe( '' ) ).
  ENDMETHOD.

  METHOD rna_cmp_of_cytosine_is_guanine.
    cl_abap_unit_assert=>assert_equals(
      exp = 'G'
      act = cut->transcribe( 'C' ) ).
  ENDMETHOD.

  METHOD rna_cmp_of_guanine_is_cytosine.
    cl_abap_unit_assert=>assert_equals(
      exp = 'C'
      act = cut->transcribe( 'G' ) ).
  ENDMETHOD.

  METHOD rna_cmp_of_thymine_is_adenine.
    cl_abap_unit_assert=>assert_equals(
      exp = 'A'
      act = cut->transcribe( 'T' ) ).
  ENDMETHOD.

  METHOD rna_cmp_of_adenine_is_uracil.
    cl_abap_unit_assert=>assert_equals(
      exp = 'U'
      act = cut->transcribe( 'A' ) ).
  ENDMETHOD.

  METHOD rna_complement.
    cl_abap_unit_assert=>assert_equals(
      exp = 'UGCACCAGAAUU'
      act = cut->transcribe( 'ACGTGGTCTTAA' ) ).
  ENDMETHOD.

ENDCLASS.
