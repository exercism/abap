CLASS zcl_isogram DEFINITION PUBLIC.

  PUBLIC SECTION.
    METHODS is_isogram
      IMPORTING
        VALUE(phrase)        TYPE string
      RETURNING
        VALUE(result) TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_isogram IMPLEMENTATION.

  METHOD is_isogram.
    result = abap_true.

    phrase = to_upper( phrase ).

    DATA(offset) = 0.
    DATA letters TYPE STANDARD TABLE OF string.

    WHILE offset < strlen( phrase ).
      DATA(letter) = phrase+offset(1).
      IF letter NA sy-abcde.
        offset = offset + 1.
        CONTINUE.
      ENDIF.

      READ TABLE letters TRANSPORTING NO FIELDS WITH KEY table_line = letter.
      IF sy-subrc = 0.
        result = abap_false.
        RETURN.
      ENDIF.
      INSERT phrase+offset(1) INTO TABLE letters.
      offset = offset + 1.
    ENDWHILE.

  ENDMETHOD.

ENDCLASS.