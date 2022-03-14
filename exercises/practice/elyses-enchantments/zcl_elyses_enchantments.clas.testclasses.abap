class lth_stack_tester definition for testing
  duration short
  risk level harmless.

  protected section.
    data cut type ref to zcl_elyses_enchantments.

    methods stack importing cards         type string
                  returning value(result) type zcl_elyses_enchantments=>ty_stack.

endclass.


class lth_stack_tester implementation.

  method stack.
    split cards at space into table data(strings).
    result = strings.
  endmethod.

endclass.


class ltc_pick_card definition final for testing
  duration short
  risk level harmless
  inheriting from lth_stack_tester.

  private section.

    methods setup.

    methods pick_first_card for testing raising cx_static_check.

    methods pick_middle_card for testing raising cx_static_check.

    methods pick_last_card for testing raising cx_static_check.

endclass.


class ltc_pick_card implementation.

  method setup.
    cut = new #( ).
  endmethod.


  method pick_first_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->get_item( stack    = stack( `1 2 3` )
                           position = 1 )
      exp = 1 ).
  endmethod.

  method pick_middle_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->get_item( stack    = stack( `4 5 6` )
                           position = 2 )
      exp = 5 ).
  endmethod.

  method pick_last_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->get_item( stack    = stack( `7 8 9` )
                           position = 3 )
      exp = 9 ).
  endmethod.

endclass.


class ltc_sleight_of_hand definition final for testing
  duration short
  risk level harmless
  inheriting from lth_stack_tester.

  private section.

    methods setup.

    methods replace_first_card for testing raising cx_static_check.
    methods replace_middle_card for testing raising cx_static_check.
    methods replace_last_card for testing raising cx_static_check.

endclass.


class ltc_sleight_of_hand implementation.

  method setup.
    cut = new #( ).
  endmethod.


  method replace_first_card.

    cl_abap_unit_assert=>assert_equals(
      act = cut->set_item( stack       = stack( `1 2 3` )
                           position    = 1
                           replacement = 7 )
      exp = stack( `7 2 3` ) ).
  endmethod.


  method replace_middle_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->set_item( stack       = stack( `2 2 2` )
                           position    = 2
                           replacement = 5 )
      exp = stack( `2 5 2` ) ).
  endmethod.

  method replace_last_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->set_item( stack       = stack( `7 7 6` )
                           position    = 3
                           replacement = 7 )
      exp = stack( `7 7 7` ) ).
  endmethod.

endclass.

class ltc_add_cards_on_top definition final for testing
  duration short
  risk level harmless
  inheriting from lth_stack_tester.

  private section.

    methods setup.

    methods add_second_card for testing raising cx_static_check.
    methods add_third_card for testing raising cx_static_check.
    methods add_fourth_card for testing raising cx_static_check.
    methods add_different_fourth_card for testing raising cx_static_check.

endclass.


class ltc_add_cards_on_top implementation.

  method setup.
    cut = new #( ).
  endmethod.

  method add_second_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->insert_item_at_top( stack    = stack( `1` )
                                     new_card = 5 )
      exp = stack( `1 5` ) ).
  endmethod.

  method add_third_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->insert_item_at_top( stack    = stack( `1 5` )
                                     new_card = 9 )
      exp = stack( `1 5 9` ) ).
  endmethod.

  method add_fourth_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->insert_item_at_top( stack    = stack( `1 5 9` )
                                     new_card = 2 )
      exp = stack( `1 5 9 2` ) ).
  endmethod.

  method add_different_fourth_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->insert_item_at_top( stack    = stack( `1 5 9` )
                                     new_card = 8 )
      exp = stack( `1 5 9 8` ) ).
  endmethod.

endclass.


class ltc_make_cards_disappear definition final for testing
  duration short
  risk level harmless
  inheriting from lth_stack_tester.

  private section.

    methods setup.

    methods remove_bottom_card for testing raising cx_static_check.
    methods remove_top_card for testing raising cx_static_check.
    methods remove_second_card for testing raising cx_static_check.
    methods remove_the_middle_two_cards for testing raising cx_static_check.

endclass.


class ltc_make_cards_disappear implementation.

  method setup.
    cut = new #( ).
  endmethod.

  method remove_bottom_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->remove_item( stack    = stack( `1 2 3 4` )
                              position = 1 )
      exp = stack( `2 3 4` ) ).
  endmethod.

  method remove_top_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->remove_item( stack    = stack( `1 2 3 4` )
                              position = 4 )
      exp = stack( `1 2 3` ) ).
  endmethod.

  method remove_second_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->remove_item( stack    = stack( `1 2 3 4` )
                              position = 2 )
      exp = stack( `1 3 4` ) ).
  endmethod.

  method remove_the_middle_two_cards.
    data(stack) = stack( `1 2 3 4` ).

    stack = cut->remove_item( stack = stack position = 2 ).
    stack = cut->remove_item( stack = stack position = 2 ).

    cl_abap_unit_assert=>assert_equals(
      act = stack
      exp = stack( `1 4` ) ).

  endmethod.

endclass.

class ltc_make_top_card_disappear definition final for testing
  duration short
  risk level harmless
  inheriting from lth_stack_tester.

  private section.

    methods setup.

    methods remove_only_card for testing raising cx_static_check.
    methods remove_a_card for testing raising cx_static_check.
    methods remove_two_cards for testing raising cx_static_check.

endclass.


class ltc_make_top_card_disappear implementation.

  method setup.
    cut = new #( ).
  endmethod.

  method remove_only_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->remove_item_from_top( stack( `1` ) )
      exp = stack( `` ) ).
  endmethod.

  method remove_a_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->remove_item_from_top( stack( `1 2 3` ) )
      exp = stack( `1 2` ) ).
  endmethod.

  method remove_two_cards.
    data(stack) = stack( `1 2 3` ).

    stack = cut->remove_item_from_top( stack ).
    stack = cut->remove_item_from_top( stack ).

    cl_abap_unit_assert=>assert_equals(
      act = stack
      exp = stack( `1` ) ).

  endmethod.

endclass.


class ltc_make_bottom_card_disappear definition final for testing
  duration short
  risk level harmless
  inheriting from lth_stack_tester.

  private section.

    methods setup.

    methods remove_only_card for testing raising cx_static_check.
    methods remove_a_card for testing raising cx_static_check.
    methods remove_two_cards for testing raising cx_static_check.

endclass.

class ltc_make_bottom_card_disappear implementation.

  method setup.
    cut = new #( ).
  endmethod.

  method remove_only_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->remove_item_from_bottom( stack( `1` ) )
      exp = stack( `` ) ).
  endmethod.


  method remove_a_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->remove_item_from_bottom( stack( `1 2 3` ) )
      exp = stack( `2 3` ) ).
  endmethod.


  method remove_two_cards.
    data(stack) = stack( `1 2 3` ).

    stack = cut->remove_item_from_bottom( stack ).
    stack = cut->remove_item_from_bottom( stack ).

    cl_abap_unit_assert=>assert_equals(
      act = stack
      exp = stack( `3` ) ).

  endmethod.

endclass.


class ltc_insert_card_at_bottom definition final for testing
  duration short
  risk level harmless
  inheriting from lth_stack_tester.

  private section.

    methods setup.

    methods insert_second_card for testing raising cx_static_check.
    methods insert_third_card for testing raising cx_static_check.
    methods insert_fourth_card for testing raising cx_static_check.
    methods insert_different_fourth_card for testing raising cx_static_check.
    methods insert_multiple_cards for testing raising cx_static_check.

endclass.

class ltc_insert_card_at_bottom implementation.

  method setup.
    cut = new #( ).
  endmethod.


  method insert_second_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->insert_item_at_bottom( stack    = stack( `1` )
                                        new_card = 5 )
      exp = stack( `5 1` ) ).
  endmethod.


  method insert_third_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->insert_item_at_bottom( stack    = stack( `5 1` )
                                        new_card = 9 )
      exp = stack( `9 5 1` ) ).
  endmethod.


  method insert_fourth_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->insert_item_at_bottom( stack    = stack( `9 5 1` )
                                        new_card = 2 )
      exp = stack( `2 9 5 1` ) ).
  endmethod.


  method insert_different_fourth_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->insert_item_at_bottom( stack    = stack( `9 5 1` )
                                        new_card = 8 )
      exp = stack( `8 9 5 1` ) ).
  endmethod.


  method insert_multiple_cards.
    data(stack) = stack( '1' ).

    stack = cut->insert_item_at_bottom( stack    = stack
                                        new_card = 5 ).
    stack = cut->insert_item_at_bottom( stack    = stack
                                        new_card = 9 ).

    cl_abap_unit_assert=>assert_equals(
      act = stack
      exp = stack( `9 5 1` ) ).
  endmethod.

endclass.

class ltc_check_length definition final for testing
  duration short
  risk level harmless
  inheriting from lth_stack_tester.

  private section.

    methods setup.
    methods empty_table for testing raising cx_static_check.
    methods one_card for testing raising cx_static_check.
    methods multiple_cards for testing raising cx_static_check.

endclass.

class ltc_check_length implementation.

  method setup.
    cut = new #( ).
  endmethod.


  method empty_table.
    cl_abap_unit_assert=>assert_equals(
      act = cut->get_size_of_stack( value #( ) )
      exp = 0 ).
  endmethod.


  method one_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->get_size_of_stack( stack( '1' ) )
      exp = 1 ).
  endmethod.


  method multiple_cards.
    cl_abap_unit_assert=>assert_equals(
      act = cut->get_size_of_stack( stack( '2 3 5' ) )
      exp = 3 ).
  endmethod.

endclass.