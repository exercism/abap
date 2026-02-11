CLASS zcl_resistor_color_trio DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS label
      IMPORTING
        colors       TYPE string_table
      RETURNING
        VALUE(result) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS color_code
      IMPORTING
        color TYPE string
      RETURNING
        VALUE(result) TYPE i.
ENDCLASS.

CLASS zcl_resistor_color_trio IMPLEMENTATION.
  METHOD label.
    DATA(color1) = colors[ 1 ].
    DATA(color2) = colors[ 2 ].
    DATA(color3) = colors[ 3 ].

    DATA(base_value) = color_code( color1 ) * 10 + color_code( color2 ).
    DATA(zeros) = color_code( color3 ).

    DATA(formatted_value) = base_value * ( 10 ** zeros ).
    DATA(unit) = CONV string( 'ohms' ).

    IF formatted_value >= 1000000000.
      formatted_value = formatted_value / 1000000000.
      unit = 'gigaohms'.
    ELSEIF formatted_value >= 1000000.
      formatted_value = formatted_value / 1000000.
      unit = 'megaohms'.
    ELSEIF formatted_value >= 1000.
      formatted_value = formatted_value / 1000.
      unit = 'kiloohms'.
    ENDIF.

    result = |{ formatted_value } { unit }|.
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
