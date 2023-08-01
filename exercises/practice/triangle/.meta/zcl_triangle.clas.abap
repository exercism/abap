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
          side_a             TYPE f
          side_b             TYPE f
          side_c             TYPE f
        RETURNING
          VALUE(result)      TYPE abap_bool,
      is_degenerate
        IMPORTING
          side_a             TYPE f
          side_b             TYPE f
          side_c             TYPE f
        RETURNING
          VALUE(result)      TYPE abap_bool.

ENDCLASS.


CLASS zcl_triangle IMPLEMENTATION.

  METHOD is_equilateral.
    " Collect triangle validity status
    DATA(noz_sides) = has_negative_or_zero_sides( side_a = side_a
                                                  side_b = side_b
                                                  side_c = side_c ).
    DATA(degenerate) = is_degenerate( side_a = side_a
                                      side_b = side_b
                                      side_c = side_c ).
    " Eliminate invalid triangles
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
    " Collect triangle validity status
    DATA(noz_sides) = has_negative_or_zero_sides( side_a = side_a
                                                  side_b = side_b
                                                  side_c = side_c ).
    DATA(degenerate) = is_degenerate( side_a = side_a
                                      side_b = side_b
                                      side_c = side_c ).
    " Eliminate invalid triangles
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
    " Collect triangle validity status
    DATA(noz_sides) = has_negative_or_zero_sides( side_a = side_a
                                                  side_b = side_b
                                                  side_c = side_c ).
    DATA(degenerate) = is_degenerate( side_a = side_a
                                      side_b = side_b
                                      side_c = side_c ).
    " Eliminate invalid triangles
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
    " Assume failure
    result = abap_false.
    " Pass only if all positive-length sides
    IF side_a <= 0 OR side_b <= 0 OR side_c <= 0.
      result = abap_true.
    ENDIF.
  ENDMETHOD.

  METHOD is_degenerate.
    " Collect triangle validity status
    DATA(side_ab) = side_a + side_b.
    DATA(side_ac) = side_a + side_c.
    DATA(side_bc) = side_b + side_c.
    " Assume failure
    result = abap_false.
    " Pass only if degeneracy test passes
    IF side_ab <= side_c OR
        side_ac <= side_b OR
        side_bc <= side_a.
      result = abap_true.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
