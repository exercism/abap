CLASS zcl_matrix DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES integertab TYPE TABLE OF i.
    METHODS matrix_row
      IMPORTING
        string        TYPE string
        index         TYPE i
      EXPORTING
        VALUE(result) TYPE integertab.
    METHODS matrix_column
      IMPORTING
        string        TYPE string
        index         TYPE i
      EXPORTING
        VALUE(result) TYPE integertab.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_matrix IMPLEMENTATION.
  METHOD matrix_row.
    SPLIT string AT '\n' INTO TABLE DATA(lines).
    DATA(result_line) = lines[ index ].
    SPLIT result_line AT space INTO TABLE DATA(result_chars).
    LOOP AT result_chars ASSIGNING FIELD-SYMBOL(<result_char>).
      APPEND <result_char> TO result.
    ENDLOOP.
  ENDMETHOD.

  METHOD matrix_column.
    DATA result_matrix TYPE TABLE OF string_table.
    SPLIT string AT '\n' INTO TABLE DATA(lines).
    LOOP AT lines ASSIGNING FIELD-SYMBOL(<line>).
      SPLIT <line> AT space INTO TABLE DATA(result_chars).
      APPEND result_chars TO result_matrix.
    ENDLOOP.

    LOOP AT result_matrix ASSIGNING FIELD-SYMBOL(<result_table>).
      LOOP AT <result_table> ASSIGNING FIELD-SYMBOL(<result_value>).
        IF sy-tabix = index.
          APPEND <result_value> TO result.
        ENDIF.
      ENDLOOP.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.