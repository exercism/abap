CLASS zcl_rna_transcription DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS:
      transcribe
        IMPORTING
          strand             TYPE string
        RETURNING
          VALUE(result)      TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_rna_transcription IMPLEMENTATION.

  METHOD transcribe.
    DATA(offset) = 0.
    DO STRLEN( strand ) TIMES.
      CASE strand+offset(1).
        WHEN 'A'.
          result = result && 'U'.
        WHEN 'C'.
          result = result && 'G'.
        WHEN 'G'.
          result = result && 'C'.
        WHEN 'T'.
          result = result && 'A'.
      ENDCASE.
      offset = offset + 1.
    ENDDO.
  ENDMETHOD.

ENDCLASS.
