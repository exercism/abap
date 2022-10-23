CLASS ltcl_state_of_tic_tac_toe DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.

    DATA cut TYPE REF TO zcl_state_of_tic_tac_toe.

    METHODS setup.

    "! Finished game where X won via left column victory
    METHODS finished_game_where_x_won_v_1 FOR TESTING RAISING cx_static_check.
    "! Finished game where X won via middle column victory
    METHODS finished_game_where_x_won_v_2 FOR TESTING RAISING cx_static_check.
    "! Finished game where X won via right column victory
    METHODS finished_game_where_x_won_v_3 FOR TESTING RAISING cx_static_check.
    "! Finished game where O won via left column victory
    METHODS finished_game_where_o_won_v_1 FOR TESTING RAISING cx_static_check.
    "! Finished game where O won via middle column victory
    METHODS finished_game_where_o_won_v_2 FOR TESTING RAISING cx_static_check.
    "! Finished game where O won via right column victory
    METHODS finished_game_where_o_won_v_3 FOR TESTING RAISING cx_static_check.
    "! Finished game where X won via top row victory
    METHODS finished_game_where_x_won_v_4 FOR TESTING RAISING cx_static_check.
    "! Finished game where X won via middle row victory
    METHODS finished_game_where_x_won_v_6 FOR TESTING RAISING cx_static_check.
    "! Finished game where X won via bottom row victory
    METHODS finished_game_where_x_won_v_7 FOR TESTING RAISING cx_static_check.
    "! Finished game where O won via top row victory
    METHODS finished_game_where_o_won_v_4 FOR TESTING RAISING cx_static_check.
    "! Finished game where O won via middle row victory
    METHODS finished_game_where_o_won_v_5 FOR TESTING RAISING cx_static_check.
    "! Finished game where O won via bottom row victory
    METHODS finished_game_where_o_won_v_6 FOR TESTING RAISING cx_static_check.
    "! Finished game where X won via falling diagonal victory
    METHODS finished_game_where_x_won_v_8 FOR TESTING RAISING cx_static_check.
    "! Finished game where X won via rising diagonal victory
    METHODS finished_game_where_x_won_v_9 FOR TESTING RAISING cx_static_check.
    "! Finished game where O won via falling diagonal victory
    METHODS finished_game_where_o_won_v_7 FOR TESTING RAISING cx_static_check.
    "! Finished game where O won via rising diagonal victory
    METHODS finished_game_where_o_won_v_8 FOR TESTING RAISING cx_static_check.
    "! Finished game where X won via a row and a column victory
    METHODS finished_game_where_x_won_v_10 FOR TESTING RAISING cx_static_check.
    "! Finished game where X won via two diagonal victories
    METHODS finished_game_where_x_won_v_11 FOR TESTING RAISING cx_static_check.
    METHODS draw FOR TESTING RAISING cx_static_check.
    METHODS another_draw FOR TESTING RAISING cx_static_check.
    METHODS ongoing_game_one_move_in FOR TESTING RAISING cx_static_check.
    METHODS ongoing_game_two_moves_in FOR TESTING RAISING cx_static_check.
    METHODS ongoing_game_five_moves_in FOR TESTING RAISING cx_static_check.
    METHODS invalid_board_x_went_twice FOR TESTING RAISING cx_static_check.
    METHODS invalid_board_o_started FOR TESTING RAISING cx_static_check.
    METHODS invalid_board FOR TESTING RAISING cx_static_check.
    "! Invalid board: X won and O kept playing
    METHODS invalid_board_x_won_and_o_kept FOR TESTING RAISING cx_static_check.
    "! Invalid board: players kept playing after a win
    METHODS invalid_board_players_kept_pla FOR TESTING RAISING cx_static_check.

ENDCLASS.


CLASS ltcl_state_of_tic_tac_toe IMPLEMENTATION.

  METHOD setup.
    cut = NEW #( ).
  ENDMETHOD.

  METHOD finished_game_where_x_won_v_1.
    cl_abap_unit_assert=>assert_equals(
      exp = zcl_state_of_tic_tac_toe=>state_enum-win
      act = cut->get_state( VALUE #( ( `XOO` )
                                     ( `X  ` )
                                     ( `X  ` ) ) ) ).
  ENDMETHOD.

  METHOD finished_game_where_x_won_v_2.
    cl_abap_unit_assert=>assert_equals(
      exp = zcl_state_of_tic_tac_toe=>state_enum-win
      act = cut->get_state( VALUE #( ( `OXO` )
                                     ( ` X ` )
                                     ( ` X ` ) ) ) ).
  ENDMETHOD.

  METHOD finished_game_where_x_won_v_3.
    cl_abap_unit_assert=>assert_equals(
      exp = zcl_state_of_tic_tac_toe=>state_enum-win
      act = cut->get_state( VALUE #( ( `OOX` )
                                     ( `  X` )
                                     ( `  X` ) ) ) ).
  ENDMETHOD.

  METHOD finished_game_where_o_won_v_1.
    cl_abap_unit_assert=>assert_equals(
      exp = zcl_state_of_tic_tac_toe=>state_enum-win
      act = cut->get_state( VALUE #( ( `OXX` )
                                     ( `OX ` )
                                     ( `O  ` ) ) ) ).
  ENDMETHOD.

  METHOD finished_game_where_o_won_v_2.
    cl_abap_unit_assert=>assert_equals(
      exp = zcl_state_of_tic_tac_toe=>state_enum-win
      act = cut->get_state( VALUE #( ( `XOX` )
                                     ( ` OX` )
                                     ( ` O ` ) ) ) ).
  ENDMETHOD.

  METHOD finished_game_where_o_won_v_3.
    cl_abap_unit_assert=>assert_equals(
      exp = zcl_state_of_tic_tac_toe=>state_enum-win
      act = cut->get_state( VALUE #( ( `XXO` )
                                     ( ` XO` )
                                     ( `  O` ) ) ) ).
  ENDMETHOD.

  METHOD finished_game_where_x_won_v_4.
    cl_abap_unit_assert=>assert_equals(
      exp = zcl_state_of_tic_tac_toe=>state_enum-win
      act = cut->get_state( VALUE #( ( `XXX` )
                                     ( `XOO` )
                                     ( `O  ` ) ) ) ).
  ENDMETHOD.

  METHOD finished_game_where_x_won_v_6.
    cl_abap_unit_assert=>assert_equals(
      exp = zcl_state_of_tic_tac_toe=>state_enum-win
      act = cut->get_state( VALUE #( ( `O  ` )
                                     ( `XXX` )
                                     ( ` O ` ) ) ) ).
  ENDMETHOD.

  METHOD finished_game_where_x_won_v_7.
    cl_abap_unit_assert=>assert_equals(
      exp = zcl_state_of_tic_tac_toe=>state_enum-win
      act = cut->get_state( VALUE #( ( ` OO` )
                                     ( `O X` )
                                     ( `XXX` ) ) ) ).
  ENDMETHOD.

  METHOD finished_game_where_o_won_v_4.
    cl_abap_unit_assert=>assert_equals(
      exp = zcl_state_of_tic_tac_toe=>state_enum-win
      act = cut->get_state( VALUE #( ( `OOO` )
                                     ( `XXO` )
                                     ( `XX ` ) ) ) ).
  ENDMETHOD.

  METHOD finished_game_where_o_won_v_5.
    cl_abap_unit_assert=>assert_equals(
      exp = zcl_state_of_tic_tac_toe=>state_enum-win
      act = cut->get_state( VALUE #( ( `XX ` )
                                     ( `OOO` )
                                     ( `X  ` ) ) ) ).
  ENDMETHOD.

  METHOD finished_game_where_o_won_v_6.
    cl_abap_unit_assert=>assert_equals(
      exp = zcl_state_of_tic_tac_toe=>state_enum-win
      act = cut->get_state( VALUE #( ( `XOX` )
                                     ( ` XX` )
                                     ( `OOO` ) ) ) ).
  ENDMETHOD.

  METHOD finished_game_where_x_won_v_8.
    cl_abap_unit_assert=>assert_equals(
      exp = zcl_state_of_tic_tac_toe=>state_enum-win
      act = cut->get_state( VALUE #( ( `XOO` )
                                     ( ` X ` )
                                     ( `  X` ) ) ) ).
  ENDMETHOD.

  METHOD finished_game_where_x_won_v_9.
    cl_abap_unit_assert=>assert_equals(
      exp = zcl_state_of_tic_tac_toe=>state_enum-win
      act = cut->get_state( VALUE #( ( `O X` )
                                     ( `OX ` )
                                     ( `X  ` ) ) ) ).
  ENDMETHOD.

  METHOD finished_game_where_o_won_v_7.
    cl_abap_unit_assert=>assert_equals(
      exp = zcl_state_of_tic_tac_toe=>state_enum-win
      act = cut->get_state( VALUE #( ( `OXX` )
                                     ( `OOX` )
                                     ( `X O` ) ) ) ).
  ENDMETHOD.

  METHOD finished_game_where_o_won_v_8.
    cl_abap_unit_assert=>assert_equals(
      exp = zcl_state_of_tic_tac_toe=>state_enum-win
      act = cut->get_state( VALUE #( ( `  O` )
                                     ( ` OX` )
                                     ( `OXX` ) ) ) ).
  ENDMETHOD.

  METHOD finished_game_where_x_won_v_10.
    cl_abap_unit_assert=>assert_equals(
      exp = zcl_state_of_tic_tac_toe=>state_enum-win
      act = cut->get_state( VALUE #( ( `XXX` )
                                     ( `XOO` )
                                     ( `XOO` ) ) ) ).
  ENDMETHOD.

  METHOD finished_game_where_x_won_v_11.
    cl_abap_unit_assert=>assert_equals(
      exp = zcl_state_of_tic_tac_toe=>state_enum-win
      act = cut->get_state( VALUE #( ( `XOX` )
                                     ( `OXO` )
                                     ( `XOX` ) ) ) ).
  ENDMETHOD.

  METHOD draw.
    cl_abap_unit_assert=>assert_equals(
      exp = zcl_state_of_tic_tac_toe=>state_enum-draw
      act = cut->get_state( VALUE #( ( `XOX` )
                                     ( `XXO` )
                                     ( `OXO` ) ) ) ).
  ENDMETHOD.

  METHOD another_draw.
    cl_abap_unit_assert=>assert_equals(
      exp = zcl_state_of_tic_tac_toe=>state_enum-draw
      act = cut->get_state( VALUE #( ( `XXO` )
                                     ( `OXX` )
                                     ( `XOO` ) ) ) ).
  ENDMETHOD.

  METHOD ongoing_game_one_move_in.
    cl_abap_unit_assert=>assert_equals(
      exp = zcl_state_of_tic_tac_toe=>state_enum-ongoing_game
      act = cut->get_state( VALUE #( ( `   ` )
                                     ( `X  ` )
                                     ( `   ` ) ) ) ).
  ENDMETHOD.

  METHOD ongoing_game_two_moves_in.
    cl_abap_unit_assert=>assert_equals(
      exp = zcl_state_of_tic_tac_toe=>state_enum-ongoing_game
      act = cut->get_state( VALUE #( ( `O  ` )
                                     ( ` X ` )
                                     ( `   ` ) ) ) ).
  ENDMETHOD.

  METHOD ongoing_game_five_moves_in.
    cl_abap_unit_assert=>assert_equals(
      exp = zcl_state_of_tic_tac_toe=>state_enum-ongoing_game
      act = cut->get_state( VALUE #( ( `X  ` )
                                     ( ` XO` )
                                     ( `OX ` ) ) ) ).
  ENDMETHOD.

  METHOD invalid_board_x_went_twice.
    TRY.
        cut->get_state( VALUE #( ( `XX ` )
                                 ( `   ` )
                                 ( `   ` ) ) ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
        " pass
    ENDTRY.
  ENDMETHOD.

  METHOD invalid_board_o_started.
    TRY.
        cut->get_state( VALUE #( ( `OOX` )
                                 ( `   ` )
                                 ( `   ` ) ) ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
        " pass
    ENDTRY.
  ENDMETHOD.

  METHOD invalid_board.
    TRY.
        cut->get_state( VALUE #( ( `XXX` )
                                 ( `OOO` )
                                 ( `   ` ) ) ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
        " pass
    ENDTRY.
  ENDMETHOD.

  METHOD invalid_board_x_won_and_o_kept.
    TRY.
        cut->get_state( VALUE #( ( `XXX` )
                                 ( `OOO` )
                                 ( `   ` ) ) ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
        " pass
    ENDTRY.
  ENDMETHOD.

  METHOD invalid_board_players_kept_pla.
    TRY.
        cut->get_state( VALUE #( ( `XXX` )
                                 ( `OOO` )
                                 ( `XOX` ) ) ).
        cl_abap_unit_assert=>fail( ).
      CATCH cx_parameter_invalid.
        " pass
    ENDTRY.
  ENDMETHOD.


ENDCLASS.
