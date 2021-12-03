CLASS zcl_hamming DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS hamming_distance
      IMPORTING
        first_strand  TYPE string
        second_strand TYPE string
      RETURNING
        VALUE(result) TYPE i
      RAISING
        cx_parameter_invalid.
ENDCLASS.

CLASS zcl_hamming IMPLEMENTATION.

  METHOD hamming_distance.
    IF strlen( first_strand ) <> strlen( second_strand ).
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
    DATA(offset) = 0.
    WHILE offset < strlen( first_strand ).
      IF first_strand+offset(1) <> second_strand+offset(1).
        result = result + 1.
      ENDIF.
      offset = offset + 1.
    ENDWHILE.
  ENDMETHOD.

ENDCLASS.