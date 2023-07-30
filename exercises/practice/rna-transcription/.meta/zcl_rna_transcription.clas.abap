CLASS zcl_rna_transcription DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS
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
    DATA(lv_transcribed) = ''.
    DO strlen( strand ) TIMES.
      CASE strand+offset(1).
        WHEN 'A'.
          lv_transcribed = lv_transcribed && 'U'.
        WHEN 'C'.
          lv_transcribed = lv_transcribed && 'G'.
        WHEN 'G'.
          lv_transcribed = lv_transcribed && 'C'.
        WHEN 'T'.
          lv_transcribed = lv_transcribed && 'A'.
      ENDCASE.
      offset = offset + 1.
    ENDDO.
    result = lv_transcribed.
  ENDMETHOD.

ENDCLASS.
