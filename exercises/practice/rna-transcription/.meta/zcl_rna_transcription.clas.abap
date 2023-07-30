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
          CONCATENATE lv_transcribed 'U'
            INTO lv_transcribed.
        WHEN 'C'.
          CONCATENATE lv_transcribed 'G'
            INTO lv_transcribed.
        WHEN 'G'.
          CONCATENATE lv_transcribed 'C'
            INTO lv_transcribed.
        WHEN 'T'.
          CONCATENATE lv_transcribed 'A'
            INTO lv_transcribed.
      ENDCASE.
      offset = offset + 1.
    ENDDO.
    result = lv_transcribed.
  ENDMETHOD.

ENDCLASS.
