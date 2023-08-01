CLASS zcl_triangle DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS:
      is_equilateral
        IMPORTING
          side_a             TYPE f
          side_b             TYPE f
          side_c             TYPE f
        RETURNING
          VALUE(result)      TYPE abap_bool
        RAISING
          cx_parameter_invalid,
      is_isosceles
        IMPORTING
          side_a             TYPE f
          side_b             TYPE f
          side_c             TYPE f
        RETURNING
          VALUE(result)      TYPE abap_bool
        RAISING
          cx_parameter_invalid,
      is_scalene
        IMPORTING
          side_a             TYPE f
          side_b             TYPE f
          side_c             TYPE f
        RETURNING
          VALUE(result)      TYPE abap_bool
        RAISING
          cx_parameter_invalid.

  PROTECTED SECTION.

  PRIVATE SECTION.
    METHODS:
      has_negative_or_zero_sides
        IMPORTING
          side_a_val         TYPE f
          side_b_val         TYPE f
          side_c_val         TYPE f
        RETURNING
          VALUE(result)      TYPE abap_bool,
      is_degenerate
        IMPORTING
          side_a_val         TYPE f
          side_b_val         TYPE f
          side_c_val         TYPE f
        RETURNING
          VALUE(result)      TYPE abap_bool.

ENDCLASS.


CLASS zcl_triangle IMPLEMENTATION.

  METHOD is_equilateral.
    " Eliminate invalid triangles
    DATA(noz_sides) = has_negative_or_zero_sides( side_a_val = side_a
                                                  side_b_val = side_b
                                                  side_c_val = side_c ).
    DATA(degenerate) = is_degenerate( side_a_val = side_a
                                      side_b_val = side_b
                                      side_c_val = side_c ).
    IF noz_sides = abap_true OR degenerate = abap_true.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
    " Assume failure, and perform criteria check for this triangle type
    result = abap_false.
    IF side_a = side_b AND side_a = side_c.
      result = abap_true.
    ENDIF.
  ENDMETHOD.

  METHOD is_isosceles.
    " Eliminate invalid triangles
    DATA(noz_sides) = has_negative_or_zero_sides( side_a_val = side_a
                                                  side_b_val = side_b
                                                  side_c_val = side_c ).
    DATA(degenerate) = is_degenerate( side_a_val = side_a
                                      side_b_val = side_b
                                      side_c_val = side_c ).
    IF noz_sides = abap_true OR degenerate = abap_true.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
    " Assume failure, and perform criteria check for this triangle type
    result = abap_false.
    IF side_a = side_b OR side_a = side_c OR side_b = side_c.
      result = abap_true.
    ENDIF.
  ENDMETHOD.

  METHOD is_scalene.
    " Eliminate invalid triangles
    DATA(noz_sides) = has_negative_or_zero_sides( side_a_val = side_a
                                                  side_b_val = side_b
                                                  side_c_val = side_c ).
    DATA(degenerate) = is_degenerate( side_a_val = side_a
                                      side_b_val = side_b
                                      side_c_val = side_c ).
    IF noz_sides = abap_true OR degenerate = abap_true.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
    " Assume failure, and perform criteria check for this triangle type
    result = abap_false.
    IF side_a <> side_b AND side_a <> side_c AND side_b <> side_c.
      result = abap_true.
    ENDIF.
  ENDMETHOD.

  METHOD has_negative_or_zero_sides.
    result = abap_false.
    IF side_a_val <= 0 OR side_b_val <= 0 OR side_c_val <= 0.
      result = abap_true.
    ENDIF.
  ENDMETHOD.

  METHOD is_degenerate.
    DATA(side_ab_val) = side_a_val + side_b_val.
    DATA(side_ac_val) = side_a_val + side_c_val.
    DATA(side_bc_val) = side_b_val + side_c_val.
    result = abap_false.
    IF side_ab_val <= side_c_val OR
        side_ac_val <= side_b_val OR
        side_bc_val <= side_a_val.
      result = abap_true.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
