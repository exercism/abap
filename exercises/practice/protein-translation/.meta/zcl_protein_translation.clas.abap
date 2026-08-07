CLASS zcl_protein_translation DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS proteins
      IMPORTING
        strand        TYPE string
      RETURNING
        VALUE(result) TYPE string_table
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS get_protein
      IMPORTING
        codon         TYPE string
      RETURNING
        VALUE(result) TYPE string
      RAISING
        cx_parameter_invalid.
ENDCLASS.

CLASS zcl_protein_translation IMPLEMENTATION.
  METHOD proteins.
    DATA(offset) = 0.
    DATA(length) = strlen( strand ).

    WHILE offset < length.
      " If we are at the end of the string but don't have enough characters for a full codon
      IF offset + 3 > length.
        RAISE EXCEPTION TYPE cx_parameter_invalid.
      ENDIF.

      DATA(codon) = substring( val = strand
                               off = offset
                               len = 3 ).
      DATA(protein) = get_protein( codon ).

      IF protein = 'STOP'.
        RETURN.
      ENDIF.

      IF protein IS NOT INITIAL.
        APPEND protein TO result.
      ENDIF.

      offset = offset + 3.
    ENDWHILE.
  ENDMETHOD.

  METHOD get_protein.
    CASE codon.
      WHEN 'AUG'.
        result = 'Methionine'.
      WHEN 'UUU' OR 'UUC'.
        result = 'Phenylalanine'.
      WHEN 'UUA' OR 'UUG'.
        result = 'Leucine'.
      WHEN 'UCU' OR 'UCC' OR 'UCA' OR 'UCG'.
        result = 'Serine'.
      WHEN 'UAU' OR 'UAC'.
        result = 'Tyrosine'.
      WHEN 'UGU' OR 'UGC'.
        result = 'Cysteine'.
      WHEN 'UGG'.
        result = 'Tryptophan'.
      WHEN 'UAA' OR 'UAG' OR 'UGA'.
        result = 'STOP'.
      WHEN OTHERS.
        RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDCASE.
  ENDMETHOD.
ENDCLASS.
