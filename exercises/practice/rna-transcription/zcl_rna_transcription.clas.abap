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
    "Implement solution
  ENDMETHOD.

ENDCLASS.
