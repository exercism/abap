CLASS ltcl_minesweeper DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_minesweeper.

    METHODS setup.
    METHODS cross FOR TESTING RAISING cx_static_check.
    METHODS horizontal_line FOR TESTING RAISING cx_static_check.
    METHODS horizontal_line_mines_at_edges FOR TESTING RAISING cx_static_check.
    METHODS large_minefield FOR TESTING RAISING cx_static_check.
    METHODS mine_surrounded_by_spaces FOR TESTING RAISING cx_static_check.
    METHODS minefield_with_only_mines FOR TESTING RAISING cx_static_check.
    METHODS no_columns FOR TESTING RAISING cx_static_check.
    METHODS no_mines FOR TESTING RAISING cx_static_check.
    METHODS no_rows FOR TESTING RAISING cx_static_check.
    METHODS space_surrounded_by_mines FOR TESTING RAISING cx_static_check.
    METHODS vertical_line FOR TESTING RAISING cx_static_check.
    METHODS vertical_line_mines_at_edges FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltcl_minesweeper IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_minesweeper( ).
  ENDMETHOD.

  METHOD no_rows.
    DATA(act_input) = VALUE string_table( ).
    DATA(exp_result) = VALUE string_table( ).
    cl_abap_unit_assert=>assert_equals(
        act = cut->annotate( input = act_input )
        exp = exp_result ).
  ENDMETHOD.

  METHOD no_columns.
    DATA(act_input) = VALUE string_table( ( || ) ).
    DATA(exp_result) = VALUE string_table( ( || ) ).
    cl_abap_unit_assert=>assert_equals(
        act = cut->annotate( input = act_input )
        exp = exp_result ).
  ENDMETHOD.

  METHOD no_mines.
    DATA(act_input) = VALUE string_table( ( |   | ) ( |   | ) ( |   | ) ).
    DATA(exp_result) = VALUE string_table( ( |   | ) ( |   | ) ( |   | ) ).
    cl_abap_unit_assert=>assert_equals(
        act = cut->annotate( input = act_input )
        exp = exp_result ).
  ENDMETHOD.

  METHOD minefield_with_only_mines.
    DATA(act_input) = VALUE string_table( ( |***| ) ( |***| ) ( |***| ) ).
    DATA(exp_result) = VALUE string_table( ( |***| ) ( |***| ) ( |***| ) ).
    cl_abap_unit_assert=>assert_equals(
        act = cut->annotate( input = act_input )
        exp = exp_result ).
  ENDMETHOD.

  METHOD mine_surrounded_by_spaces.
    DATA(act_input) = VALUE string_table( ( |   | ) ( | * | ) ( |   | ) ).
    DATA(exp_result) = VALUE string_table( ( |111| ) ( |1*1| ) ( |111| ) ).
    cl_abap_unit_assert=>assert_equals(
        act = cut->annotate( input = act_input )
        exp = exp_result ).
  ENDMETHOD.

  METHOD space_surrounded_by_mines.
    DATA(act_input) = VALUE string_table( ( |***| ) ( |* *| ) ( |***| ) ).
    DATA(exp_result) = VALUE string_table( ( |***| ) ( |*8*| ) ( |***| ) ).
    cl_abap_unit_assert=>assert_equals(
        act = cut->annotate( input = act_input )
        exp = exp_result ).
  ENDMETHOD.

  METHOD horizontal_line.
    DATA(act_input) = VALUE string_table( ( | * * | ) ).
    DATA(exp_result) = VALUE string_table( ( |1*2*1| ) ).
    cl_abap_unit_assert=>assert_equals(
        act = cut->annotate( input = act_input )
        exp = exp_result ).
  ENDMETHOD.

  METHOD horizontal_line_mines_at_edges.
    DATA(act_input) = VALUE string_table( ( |*   *| ) ).
    DATA(exp_result) = VALUE string_table( ( |*1 1*| ) ).
    cl_abap_unit_assert=>assert_equals(
        act = cut->annotate( input = act_input )
        exp = exp_result ).
  ENDMETHOD.

  METHOD vertical_line.
    DATA(act_input) = VALUE string_table( ( | | ) ( |*| ) ( | | ) ( |*| ) ( | | ) ).
    DATA(exp_result) = VALUE string_table( ( |1| ) ( |*| ) ( |2| ) ( |*| ) ( |1| ) ).
    cl_abap_unit_assert=>assert_equals(
        act = cut->annotate( input = act_input )
        exp = exp_result ).
  ENDMETHOD.

  METHOD vertical_line_mines_at_edges.
    DATA(act_input) = VALUE string_table( ( |*| ) ( | | ) ( | | ) ( | | ) ( |*| ) ).
    DATA(exp_result) = VALUE string_table( ( |*| ) ( |1| ) ( | | ) ( |1| ) ( |*| ) ).
    cl_abap_unit_assert=>assert_equals(
        act = cut->annotate( input = act_input )
        exp = exp_result ).
  ENDMETHOD.

  METHOD cross.
    DATA(act_input) = VALUE string_table( ( |  *  | ) ( |  *  | ) ( |*****| ) ( |  *  | ) ( |  *  | ) ).
    DATA(exp_result) = VALUE string_table( ( | 2*2 | ) ( |25*52| ) ( |*****| ) ( |25*52| ) ( | 2*2 | ) ).
    cl_abap_unit_assert=>assert_equals(
        act = cut->annotate( input = act_input )
        exp = exp_result ).
  ENDMETHOD.

  METHOD large_minefield.
    DATA(act_input) =
      VALUE string_table( ( | *  * | ) ( |  *   | ) ( |    * | ) ( |   * *| ) ( | *  * | ) ( |      | ) ).
    DATA(exp_result) =
      VALUE string_table( ( |1*22*1| ) ( |12*322| ) ( | 123*2| ) ( |112*4*| ) ( |1*22*2| ) ( |111111| ) ).
    cl_abap_unit_assert=>assert_equals(
        act = cut->annotate( input = act_input )
        exp = exp_result ).
  ENDMETHOD.

ENDCLASS.
