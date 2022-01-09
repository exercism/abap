CLASS zcl_rle DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS encode IMPORTING input         TYPE string
                   RETURNING VALUE(result) TYPE string.

    METHODS decode IMPORTING input         TYPE string
                   RETURNING VALUE(result) TYPE string.

ENDCLASS.


CLASS zcl_rle IMPLEMENTATION.

  METHOD encode.

    DATA: character  TYPE string,
          duplicates TYPE string.

    DATA(str) = input.

    WHILE str IS NOT INITIAL.

      FIND REGEX '([\w|\s])(\1*)(.*)' IN str SUBMATCHES character duplicates str  ##SUBRC_OK.

      IF duplicates IS NOT INITIAL.
        result = |{ result }{ strlen( duplicates ) + 1 }{ character }|.
      ELSE.
        result = |{ result }{ character }|.
      ENDIF.

    ENDWHILE.

  ENDMETHOD.


  METHOD decode.

    DATA: character TYPE string,
          reps      TYPE string.

    DATA(str) = input.

    WHILE str IS NOT INITIAL.

      FIND REGEX '(\d*)([\w|\s])(.*)' IN str SUBMATCHES reps character str  ##SUBRC_OK.

      IF reps IS NOT INITIAL.
        result = |{ result }{ repeat( val = character occ = reps ) }|.
      ELSE.
        result = |{ result }{ character }|.
      ENDIF.

    ENDWHILE.

  ENDMETHOD.

ENDCLASS.