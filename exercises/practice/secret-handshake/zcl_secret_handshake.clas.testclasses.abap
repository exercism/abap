CLASS ltcl_secret_handshake DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.

    DATA cut TYPE REF TO zcl_secret_handshake.

    METHODS setup.

    "! wink for 0b1
    METHODS wink_for_1 FOR TESTING RAISING cx_static_check.
    "! double blink for 0b10
    METHODS double_blink_for_10 FOR TESTING RAISING cx_static_check.
    "! close your eyes for 0b100
    METHODS close_your_eyes_for_100 FOR TESTING RAISING cx_static_check.
    "! jump for 0b1000
    METHODS jump_for_1000 FOR TESTING RAISING cx_static_check.
    METHODS combine_two_actions FOR TESTING RAISING cx_static_check.
    METHODS reverse_two_actions FOR TESTING RAISING cx_static_check.
    "! reversing one action gives the same action
    METHODS reverse_one_actions FOR TESTING RAISING cx_static_check.
    "! reversing no actions still gives no actions
    METHODS reverse_no_action FOR TESTING RAISING cx_static_check.
    METHODS all_possible_actions FOR TESTING RAISING cx_static_check.
    METHODS reverse_all_possible_actions FOR TESTING RAISING cx_static_check.
    METHODS do_nothing_for_zero FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltcl_secret_handshake IMPLEMENTATION.

  METHOD setup.
    cut = NEW #( ).
  ENDMETHOD.

  METHOD wink_for_1.
    cl_abap_unit_assert=>assert_equals(
      exp = VALUE string_table( ( `wink` ) )
      act = cut->get_commands( 1 ) ).
  ENDMETHOD.

  METHOD double_blink_for_10.
    cl_abap_unit_assert=>assert_equals(
      exp = VALUE string_table( ( `double blink` ) )
      act = cut->get_commands( 2 ) ).
  ENDMETHOD.

  METHOD close_your_eyes_for_100.
    cl_abap_unit_assert=>assert_equals(
      exp = VALUE string_table( ( `close your eyes` ) )
      act = cut->get_commands( 4 ) ).
  ENDMETHOD.

  METHOD jump_for_1000.
    cl_abap_unit_assert=>assert_equals(
      exp = VALUE string_table( ( `jump` ) )
      act = cut->get_commands( 8 ) ).
  ENDMETHOD.

  METHOD combine_two_actions.
    cl_abap_unit_assert=>assert_equals(
      exp = VALUE string_table( ( `wink` ) ( `double blink` ) )
      act = cut->get_commands( 3 ) ).
  ENDMETHOD.

  METHOD reverse_two_actions.
    cl_abap_unit_assert=>assert_equals(
      exp = VALUE string_table( ( `double blink` ) ( `wink` ) )
      act = cut->get_commands( 19 ) ).
  ENDMETHOD.

  METHOD reverse_one_actions.
    cl_abap_unit_assert=>assert_equals(
      exp = VALUE string_table( ( `jump` ) )
      act = cut->get_commands( 24 ) ).
  ENDMETHOD.

  METHOD reverse_no_action.
    cl_abap_unit_assert=>assert_equals(
      exp = VALUE string_table( )
      act = cut->get_commands( 16 ) ).
  ENDMETHOD.

  METHOD all_possible_actions.
    cl_abap_unit_assert=>assert_equals(
      exp = VALUE string_table( ( `wink` ) ( `double blink` )  ( `close your eyes` )  ( `jump` ) )
      act = cut->get_commands( 15 ) ).
  ENDMETHOD.

  METHOD reverse_all_possible_actions.
    cl_abap_unit_assert=>assert_equals(
      exp = VALUE string_table( ( `jump` ) ( `close your eyes` ) ( `double blink` ) ( `wink` ) )
      act = cut->get_commands( 31 ) ).
  ENDMETHOD.

  METHOD do_nothing_for_zero.
    cl_abap_unit_assert=>assert_equals(
      exp = VALUE string_table( )
      act = cut->get_commands( 0 ) ).
  ENDMETHOD.

ENDCLASS.
