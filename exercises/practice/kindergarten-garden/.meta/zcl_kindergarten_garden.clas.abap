CLASS zcl_kindergarten_garden DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor.

    METHODS plants
      IMPORTING
        diagram        TYPE string
        student        TYPE string
      RETURNING
        VALUE(results) TYPE string_table.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA students TYPE string_table.

ENDCLASS.


CLASS zcl_kindergarten_garden IMPLEMENTATION.

  METHOD constructor.
    students = VALUE #( ( |Alice| ) ( |Bob| ) ( |Charlie| ) ( |David| ) ( |Eve| ) ( |Fred| )
                        ( |Ginny| ) ( |Harriet| ) ( |Ileana| ) ( |Joseph| ) ( |Kincaid| ) ( |Larry| ) ).
  ENDMETHOD.

  METHOD plants.
    SPLIT diagram AT '\n' INTO TABLE DATA(rows).
    LOOP AT students ASSIGNING FIELD-SYMBOL(<student>).
      IF <student> = student.
        DATA(column1) = (  sy-tabix * 2 ) - 2.
        DATA(column2) = (  sy-tabix * 2 ) - 1.
      ENDIF.
    ENDLOOP.
    DATA(row1) = rows[ 1 ].
    DATA(row2) = rows[ 2 ].
    APPEND row1+column1(1) TO results.
    APPEND row1+column2(1) TO results.
    APPEND row2+column1(1) TO results.
    APPEND row2+column2(1) TO results.
    LOOP AT results ASSIGNING FIELD-SYMBOL(<plant>).
      IF <plant> = 'R'.
        <plant> = 'radishes'.
      ENDIF.
      IF <plant> = 'C'.
        <plant> = 'clover'.
      ENDIF.
      IF <plant> = 'G'.
        <plant> = 'grass'.
      ENDIF.
      IF <plant> = 'V'.
        <plant> = 'violets'.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.


ENDCLASS.