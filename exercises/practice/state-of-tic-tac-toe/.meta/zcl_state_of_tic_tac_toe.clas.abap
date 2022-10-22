CLASS zcl_state_of_tic_tac_toe DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES player_type TYPE c LENGTH 1.
    TYPES board_type TYPE TABLE OF string INITIAL SIZE 3.

    CONSTANTS: BEGIN OF player_enum,
                 one TYPE player_type VALUE 'X',
                 two TYPE player_type VALUE 'O',
               END OF player_enum.

    CONSTANTS: BEGIN OF state_enum,
                 ongoing_game TYPE string VALUE `Ongoing game`,
                 draw         TYPE string VALUE `Draw`,
                 win          TYPE string VALUE `Win`,
               END OF state_enum.

    METHODS get_state
      IMPORTING board         TYPE board_type
      RETURNING VALUE(state) TYPE string
      RAISING   zcx_tic_tac_toe_invalid_board.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA board TYPE board_type.
    METHODS count_plies_for_player
      IMPORTING player       TYPE player_type
      RETURNING VALUE(plies) TYPE i.
    METHODS total_plies
      RETURNING VALUE(plies) TYPE i.
    METHODS count_wins
      IMPORTING player      TYPE player_type
      RETURNING VALUE(wins) TYPE i.
    METHODS add_one_if_row_is_won
      IMPORTING row         TYPE string
                player      TYPE player_type
      RETURNING VALUE(wins) TYPE i.
ENDCLASS.



CLASS zcl_state_of_tic_tac_toe IMPLEMENTATION.

  METHOD get_state.

    me->board = board.
    IF count_plies_for_player( player_enum-two ) > count_plies_for_player( player_enum-one ).
      RAISE EXCEPTION NEW zcx_tic_tac_toe_invalid_board( ).  " Wrong turn order: O started
    ENDIF.
    IF abs( count_plies_for_player( player_enum-two ) - count_plies_for_player( player_enum-one ) ) > 1.
      RAISE EXCEPTION NEW zcx_tic_tac_toe_invalid_board( ).  " Wrong turn order: one player went twice
    ENDIF.
    IF count_wins( player_enum-one ) > 0 AND  count_wins( player_enum-two ) > 0.
      RAISE EXCEPTION NEW zcx_tic_tac_toe_invalid_board( ).  " Continued playing after win
    ENDIF.
    IF count_wins( player_enum-one ) + count_wins( player_enum-two ) = 0.
      IF total_plies( ) = 9.
        state = state_enum-draw.
      ELSE.
        state = state_enum-ongoing_game.
      ENDIF.
    ELSE.
      state = state_enum-win.
    ENDIF.

  ENDMETHOD.

  METHOD count_plies_for_player.
    DO 3 TIMES.
      plies += count( val = board[ sy-index ] sub = player ).
    ENDDO.
  ENDMETHOD.

  METHOD total_plies.
    plies = count_plies_for_player( player_enum-one ) + count_plies_for_player( player_enum-two ).
  ENDMETHOD.

  METHOD count_wins.
    DATA row TYPE string.
    DO 3 TIMES.
      wins += add_one_if_row_is_won( row = board[ sy-index ] player = player ).
    ENDDO.
    DO 3 TIMES.
      row = |{ substring( val = board[ 1 ] off = sy-index - 1 len = 1 ) }| &&
            |{ substring( val = board[ 2 ] off = sy-index - 1 len = 1 ) }| &&
            |{ substring( val = board[ 3 ] off = sy-index - 1 len = 1 ) }|.
      wins += add_one_if_row_is_won( row = row player = player ).
    ENDDO.
    row = |{ substring( val = board[ 1 ] off = 0 len = 1 ) }| &&
          |{ substring( val = board[ 2 ] off = 1 len = 1 ) }| &&
          |{ substring( val = board[ 3 ] off = 2 len = 1 ) }|.
    wins += add_one_if_row_is_won( row = row player = player ).
    row = |{ substring( val = board[ 1 ] off = 2 len = 1 ) }| &&
          |{ substring( val = board[ 2 ] off = 1 len = 1 ) }| &&
          |{ substring( val = board[ 3 ] off = 0 len = 1 ) }|.
    wins += add_one_if_row_is_won( row = row player = player ).
  ENDMETHOD.

  METHOD add_one_if_row_is_won.
    wins = COND #( WHEN row = |{ player }{ player }{ player }|
                   THEN 1 ELSE 0 ).
  ENDMETHOD.


ENDCLASS.
