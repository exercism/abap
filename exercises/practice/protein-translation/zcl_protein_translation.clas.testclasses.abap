*"* use this source file for your ABAP unit test classes
CLASS ltcl_protein_translation DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_protein_translation.

    METHODS setup.
    METHODS empty_rna FOR TESTING.
    METHODS methionine FOR TESTING.
    METHODS phenylalanine_1 FOR TESTING.
    METHODS phenylalanine_2 FOR TESTING.
    METHODS leucine_1 FOR TESTING.
    METHODS leucine_2 FOR TESTING.
    METHODS serine_1 FOR TESTING.
    METHODS serine_2 FOR TESTING.
    METHODS serine_3 FOR TESTING.
    METHODS serine_4 FOR TESTING.
    METHODS tyrosine_1 FOR TESTING.
    METHODS tyrosine_2 FOR TESTING.
    METHODS cysteine_1 FOR TESTING.
    METHODS cysteine_2 FOR TESTING.
    METHODS tryptophan FOR TESTING.
    METHODS stop_codon_1 FOR TESTING.
    METHODS stop_codon_2 FOR TESTING.
    METHODS stop_codon_3 FOR TESTING.
    METHODS two_protein_codons FOR TESTING.
    METHODS two_diff_protein_codons FOR TESTING.
    METHODS translate_rna_strand FOR TESTING.
    METHODS stops_at_beginning FOR TESTING.
    METHODS stops_at_end_of_two FOR TESTING.
    METHODS stops_at_end_of_three FOR TESTING.
    METHODS stops_in_middle_of_three FOR TESTING.
    METHODS stops_in_middle_of_six FOR TESTING.
    METHODS two_non_stop_codons FOR TESTING.
    METHODS non_existing_codon FOR TESTING.
    METHODS unknown_amino_acids FOR TESTING.
    METHODS incomplete_rna_sequence FOR TESTING.
    METHODS incomplete_but_valid_rna FOR TESTING.

ENDCLASS.

CLASS ltcl_protein_translation IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_protein_translation( ).
  ENDMETHOD.

  METHOD empty_rna.
    DATA(expected_values) = VALUE string_table( ).
    DATA(result) = cut->proteins( '' ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = expected_values ).
  ENDMETHOD.

  METHOD methionine.
    DATA(expected_values) = VALUE string_table( ( |Methionine| ) ).
    DATA(result) = cut->proteins( 'AUG' ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = expected_values ).
  ENDMETHOD.

  METHOD phenylalanine_1.
    DATA(expected_values) = VALUE string_table( ( |Phenylalanine| ) ).
    DATA(result) = cut->proteins( 'UUU' ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = expected_values ).
  ENDMETHOD.

  METHOD phenylalanine_2.
    DATA(expected_values) = VALUE string_table( ( |Phenylalanine| ) ).
    DATA(result) = cut->proteins( 'UUC' ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = expected_values ).
  ENDMETHOD.

  METHOD leucine_1.
    DATA(expected_values) = VALUE string_table( ( |Leucine| ) ).
    DATA(result) = cut->proteins( 'UUA' ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = expected_values ).
  ENDMETHOD.

  METHOD leucine_2.
    DATA(expected_values) = VALUE string_table( ( |Leucine| ) ).
    DATA(result) = cut->proteins( 'UUG' ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = expected_values ).
  ENDMETHOD.

  METHOD serine_1.
    DATA(expected_values) = VALUE string_table( ( |Serine| ) ).
    DATA(result) = cut->proteins( 'UCU' ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = expected_values ).
  ENDMETHOD.

  METHOD serine_2.
    DATA(expected_values) = VALUE string_table( ( |Serine| ) ).
    DATA(result) = cut->proteins( 'UCC' ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = expected_values ).
  ENDMETHOD.

  METHOD serine_3.
    DATA(expected_values) = VALUE string_table( ( |Serine| ) ).
    DATA(result) = cut->proteins( 'UCA' ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = expected_values ).
  ENDMETHOD.

  METHOD serine_4.
    DATA(expected_values) = VALUE string_table( ( |Serine| ) ).
    DATA(result) = cut->proteins( 'UCG' ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = expected_values ).
  ENDMETHOD.

  METHOD tyrosine_1.
    DATA(expected_values) = VALUE string_table( ( |Tyrosine| ) ).
    DATA(result) = cut->proteins( 'UAU' ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = expected_values ).
  ENDMETHOD.

  METHOD tyrosine_2.
    DATA(expected_values) = VALUE string_table( ( |Tyrosine| ) ).
    DATA(result) = cut->proteins( 'UAC' ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = expected_values ).
  ENDMETHOD.

  METHOD cysteine_1.
    DATA(expected_values) = VALUE string_table( ( |Cysteine| ) ).
    DATA(result) = cut->proteins( 'UGU' ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = expected_values ).
  ENDMETHOD.

  METHOD cysteine_2.
    DATA(expected_values) = VALUE string_table( ( |Cysteine| ) ).
    DATA(result) = cut->proteins( 'UGC' ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = expected_values ).
  ENDMETHOD.

  METHOD tryptophan.
    DATA(expected_values) = VALUE string_table( ( |Tryptophan| ) ).
    DATA(result) = cut->proteins( 'UGG' ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = expected_values ).
  ENDMETHOD.

  METHOD stop_codon_1.
    DATA(expected_values) = VALUE string_table( ).
    DATA(result) = cut->proteins( 'UAA' ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = expected_values ).
  ENDMETHOD.

  METHOD stop_codon_2.
    DATA(expected_values) = VALUE string_table( ).
    DATA(result) = cut->proteins( 'UAG' ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = expected_values ).
  ENDMETHOD.

  METHOD stop_codon_3.
    DATA(expected_values) = VALUE string_table( ).
    DATA(result) = cut->proteins( 'UGA' ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = expected_values ).
  ENDMETHOD.

  METHOD two_protein_codons.
    DATA(expected_values) = VALUE string_table( ( |Phenylalanine| ) ( |Phenylalanine| ) ).
    DATA(result) = cut->proteins( 'UUUUUU' ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = expected_values ).
  ENDMETHOD.

  METHOD two_diff_protein_codons.
    DATA(expected_values) = VALUE string_table( ( |Leucine| ) ( |Leucine| ) ).
    DATA(result) = cut->proteins( 'UUAUUG' ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = expected_values ).
  ENDMETHOD.

  METHOD translate_rna_strand.
    DATA(expected_values) = VALUE string_table( ( |Methionine| ) ( |Phenylalanine| ) ( |Tryptophan| ) ).
    DATA(result) = cut->proteins( 'AUGUUUUGG' ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = expected_values ).
  ENDMETHOD.

  METHOD stops_at_beginning.
    DATA(expected_values) = VALUE string_table( ).
    DATA(result) = cut->proteins( 'UAGUGG' ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = expected_values ).
  ENDMETHOD.

  METHOD stops_at_end_of_two.
    DATA(expected_values) = VALUE string_table( ( |Tryptophan| ) ).
    DATA(result) = cut->proteins( 'UGGUAG' ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = expected_values ).
  ENDMETHOD.

  METHOD stops_at_end_of_three.
    DATA(expected_values) = VALUE string_table( ( |Methionine| ) ( |Phenylalanine| ) ).
    DATA(result) = cut->proteins( 'AUGUUUUAA' ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = expected_values ).
  ENDMETHOD.

  METHOD stops_in_middle_of_three.
    DATA(expected_values) = VALUE string_table( ( |Tryptophan| ) ).
    DATA(result) = cut->proteins( 'UGGUAGUGG' ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = expected_values ).
  ENDMETHOD.

  METHOD stops_in_middle_of_six.
    DATA(expected_values) = VALUE string_table( ( |Tryptophan| ) ( |Cysteine| ) ( |Tyrosine| ) ).
    DATA(result) = cut->proteins( 'UGGUGUUAUUAAUGGUUU' ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = expected_values ).
  ENDMETHOD.

  METHOD two_non_stop_codons.
    DATA(expected_values) = VALUE string_table( ( |Methionine| ) ( |Methionine| ) ).
    DATA(result) = cut->proteins( 'AUGAUG' ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = expected_values ).
  ENDMETHOD.

  METHOD non_existing_codon.
    TRY.
        cut->proteins( 'AAA' ).
        cl_abap_unit_assert=>fail( 'Should have raised cx_parameter_invalid' ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.

  METHOD unknown_amino_acids.
    TRY.
        cut->proteins( 'XYZ' ).
        cl_abap_unit_assert=>fail( 'Should have raised cx_parameter_invalid' ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.

  METHOD incomplete_rna_sequence.
    TRY.
        cut->proteins( 'AUGU' ).
        cl_abap_unit_assert=>fail( 'Should have raised cx_parameter_invalid' ).
      CATCH cx_parameter_invalid.
    ENDTRY.
  ENDMETHOD.

  METHOD incomplete_but_valid_rna.
    DATA(expected_values) = VALUE string_table( ( |Phenylalanine| ) ( |Phenylalanine| ) ).
    DATA(result) = cut->proteins( 'UUCUUCUAAUGGU' ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = expected_values ).
  ENDMETHOD.

ENDCLASS.
