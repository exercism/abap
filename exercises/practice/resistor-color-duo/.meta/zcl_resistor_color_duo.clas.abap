CLASS zcl_resistor_color_duo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS value
      IMPORTING
        colors       TYPE string_table
      RETURNING
        VALUE(result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS color_code
      IMPORTING
        color TYPE string
      RETURNING
        VALUE(result) TYPE i.
ENDCLASS.

CLASS zcl_resistor_color_duo IMPLEMENTATION.
  METHOD value.
    DATA(color1) = colors[ 1 ].
    DATA(color2) = colors[ 2 ].

    result = color_code( color1 ) * 10 + color_code( color2 ).
  ENDMETHOD.

  METHOD color_code.
    CASE color.
      WHEN 'black'.
        result = 0.
      WHEN 'brown'.
        result = 1.
      WHEN 'red'.
        result = 2.
      WHEN 'orange'.
        result = 3.
      WHEN 'yellow'.
        result = 4.
      WHEN 'green'.
        result = 5.
      WHEN 'blue'.
        result = 6.
      WHEN 'violet'.
        result = 7.
      WHEN 'grey'.
        result = 8.
      WHEN 'white'.
        result = 9.
    ENDCASE.
  ENDMETHOD.
ENDCLASS.
