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

    DATA: char       TYPE string,
          duplicates TYPE string.

    DATA(str) = input.

    WHILE str IS NOT INITIAL.

      FIND REGEX '([\w|\s])(\1*)(.*)' IN str SUBMATCHES char duplicates str  ##SUBRC_OK.

      IF duplicates IS NOT INITIAL.
        result = |{ result }{ strlen( duplicates ) + 1 }{ char }|.
      ELSE.
        result = |{ result }{ char }|.
      ENDIF.

    ENDWHILE.

  ENDMETHOD.


  METHOD decode.

    DATA: char TYPE string,
          reps TYPE string.

    DATA(str) = input.

    WHILE str IS NOT INITIAL.

      FIND REGEX '(\d*)([\w|\s])(.*)' IN str SUBMATCHES reps char str  ##SUBRC_OK.

      IF reps IS NOT INITIAL.
        result = |{ result }{ repeat( val = char occ = reps ) }|.
      ELSE.
        result = |{ result }{ char }|.
      ENDIF.

    ENDWHILE.

  ENDMETHOD.

ENDCLASS.