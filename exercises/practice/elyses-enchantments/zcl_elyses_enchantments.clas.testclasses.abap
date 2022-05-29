CLASS lth_stack_tester DEFINITION FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PROTECTED SECTION.
    DATA cut TYPE REF TO zcl_elyses_enchantments.

    METHODS stack IMPORTING cards         TYPE string
                  RETURNING VALUE(result) TYPE zcl_elyses_enchantments=>ty_stack.

ENDCLASS.


CLASS lth_stack_tester IMPLEMENTATION.

  METHOD stack.
    SPLIT cards AT space INTO TABLE DATA(strings).
    result = strings.
  ENDMETHOD.

ENDCLASS.


CLASS ltc_pick_card DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS
  INHERITING FROM lth_stack_tester.

  PRIVATE SECTION.

    METHODS setup.

    METHODS pick_first_card FOR TESTING RAISING cx_static_check.
    METHODS pick_middle_card FOR TESTING RAISING cx_static_check.
    METHODS pick_last_card FOR TESTING RAISING cx_static_check.

ENDCLASS.


CLASS ltc_pick_card IMPLEMENTATION.

  METHOD setup.
    cut = NEW #( ).
  ENDMETHOD.


  METHOD pick_first_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->get_item( stack    = stack( `1 2 3` )
                           position = 1 )
      exp = 1 ).
  ENDMETHOD.


  METHOD pick_middle_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->get_item( stack    = stack( `4 5 6` )
                           position = 2 )
      exp = 5 ).
  ENDMETHOD.


  METHOD pick_last_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->get_item( stack    = stack( `7 8 9` )
                           position = 3 )
      exp = 9 ).
  ENDMETHOD.

ENDCLASS.


CLASS ltc_sleight_of_hand DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS
  INHERITING FROM lth_stack_tester.

  PRIVATE SECTION.

    METHODS setup.

    METHODS replace_first_card FOR TESTING RAISING cx_static_check.
    METHODS replace_middle_card FOR TESTING RAISING cx_static_check.
    METHODS replace_last_card FOR TESTING RAISING cx_static_check.

ENDCLASS.


CLASS ltc_sleight_of_hand IMPLEMENTATION.

  METHOD setup.
    cut = NEW #( ).
  ENDMETHOD.


  METHOD replace_first_card.

    cl_abap_unit_assert=>assert_equals(
      act = cut->set_item( stack       = stack( `1 2 3` )
                           position    = 1
                           replacement = 7 )
      exp = stack( `7 2 3` ) ).
  ENDMETHOD.


  METHOD replace_middle_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->set_item( stack       = stack( `2 2 2` )
                           position    = 2
                           replacement = 5 )
      exp = stack( `2 5 2` ) ).
  ENDMETHOD.


  METHOD replace_last_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->set_item( stack       = stack( `7 7 6` )
                           position    = 3
                           replacement = 7 )
      exp = stack( `7 7 7` ) ).
  ENDMETHOD.

ENDCLASS.

CLASS ltc_add_cards_on_top DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS
  INHERITING FROM lth_stack_tester.

  PRIVATE SECTION.

    METHODS setup.

    METHODS add_second_card FOR TESTING RAISING cx_static_check.
    METHODS add_third_card FOR TESTING RAISING cx_static_check.
    METHODS add_fourth_card FOR TESTING RAISING cx_static_check.
    METHODS add_different_fourth_card FOR TESTING RAISING cx_static_check.

ENDCLASS.


CLASS ltc_add_cards_on_top IMPLEMENTATION.

  METHOD setup.
    cut = NEW #( ).
  ENDMETHOD.


  METHOD add_second_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->insert_item_at_top( stack    = stack( `1` )
                                     new_card = 5 )
      exp = stack( `1 5` ) ).
  ENDMETHOD.


  METHOD add_third_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->insert_item_at_top( stack    = stack( `1 5` )
                                     new_card = 9 )
      exp = stack( `1 5 9` ) ).
  ENDMETHOD.


  METHOD add_fourth_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->insert_item_at_top( stack    = stack( `1 5 9` )
                                     new_card = 2 )
      exp = stack( `1 5 9 2` ) ).
  ENDMETHOD.


  METHOD add_different_fourth_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->insert_item_at_top( stack    = stack( `1 5 9` )
                                     new_card = 8 )
      exp = stack( `1 5 9 8` ) ).
  ENDMETHOD.

ENDCLASS.


CLASS ltc_make_cards_disappear DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS
  INHERITING FROM lth_stack_tester.

  PRIVATE SECTION.

    METHODS setup.

    METHODS remove_bottom_card FOR TESTING RAISING cx_static_check.
    METHODS remove_top_card FOR TESTING RAISING cx_static_check.
    METHODS remove_second_card FOR TESTING RAISING cx_static_check.
    METHODS remove_the_middle_two_cards FOR TESTING RAISING cx_static_check.

ENDCLASS.


CLASS ltc_make_cards_disappear IMPLEMENTATION.

  METHOD setup.
    cut = NEW #( ).
  ENDMETHOD.

  METHOD remove_bottom_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->remove_item( stack    = stack( `1 2 3 4` )
                              position = 1 )
      exp = stack( `2 3 4` ) ).
  ENDMETHOD.


  METHOD remove_top_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->remove_item( stack    = stack( `1 2 3 4` )
                              position = 4 )
      exp = stack( `1 2 3` ) ).
  ENDMETHOD.


  METHOD remove_second_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->remove_item( stack    = stack( `1 2 3 4` )
                              position = 2 )
      exp = stack( `1 3 4` ) ).
  ENDMETHOD.


  METHOD remove_the_middle_two_cards.
    DATA(stack) = stack( `1 2 3 4` ).

    stack = cut->remove_item( stack    = stack
                              position = 2 ).
    stack = cut->remove_item( stack    = stack
                              position = 2 ).

    cl_abap_unit_assert=>assert_equals(
      act = stack
      exp = stack( `1 4` ) ).

  ENDMETHOD.

ENDCLASS.

CLASS ltc_make_top_card_disappear DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS
  INHERITING FROM lth_stack_tester.

  PRIVATE SECTION.

    METHODS setup.

    METHODS remove_only_card FOR TESTING RAISING cx_static_check.
    METHODS remove_a_card FOR TESTING RAISING cx_static_check.
    METHODS remove_two_cards FOR TESTING RAISING cx_static_check.

ENDCLASS.


CLASS ltc_make_top_card_disappear IMPLEMENTATION.

  METHOD setup.
    cut = NEW #( ).
  ENDMETHOD.


  METHOD remove_only_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->remove_item_from_top( stack( `1` ) )
      exp = stack( `` ) ).
  ENDMETHOD.


  METHOD remove_a_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->remove_item_from_top( stack( `1 2 3` ) )
      exp = stack( `1 2` ) ).
  ENDMETHOD.


  METHOD remove_two_cards.
    DATA(stack) = stack( `1 2 3` ).

    stack = cut->remove_item_from_top( stack ).
    stack = cut->remove_item_from_top( stack ).

    cl_abap_unit_assert=>assert_equals(
      act = stack
      exp = stack( `1` ) ).

  ENDMETHOD.

ENDCLASS.


CLASS ltc_make_bottom_card_disappear DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS
  INHERITING FROM lth_stack_tester.

  PRIVATE SECTION.

    METHODS setup.

    METHODS remove_only_card FOR TESTING RAISING cx_static_check.
    METHODS remove_a_card FOR TESTING RAISING cx_static_check.
    METHODS remove_two_cards FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltc_make_bottom_card_disappear IMPLEMENTATION.

  METHOD setup.
    cut = NEW #( ).
  ENDMETHOD.


  METHOD remove_only_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->remove_item_from_bottom( stack( `1` ) )
      exp = stack( `` ) ).
  ENDMETHOD.


  METHOD remove_a_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->remove_item_from_bottom( stack( `1 2 3` ) )
      exp = stack( `2 3` ) ).
  ENDMETHOD.


  METHOD remove_two_cards.
    DATA(stack) = stack( `1 2 3` ).

    stack = cut->remove_item_from_bottom( stack ).
    stack = cut->remove_item_from_bottom( stack ).

    cl_abap_unit_assert=>assert_equals(
      act = stack
      exp = stack( `3` ) ).

  ENDMETHOD.

ENDCLASS.


CLASS ltc_insert_card_at_bottom DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS
  INHERITING FROM lth_stack_tester.

  PRIVATE SECTION.

    METHODS setup.

    METHODS insert_second_card FOR TESTING RAISING cx_static_check.
    METHODS insert_third_card FOR TESTING RAISING cx_static_check.
    METHODS insert_fourth_card FOR TESTING RAISING cx_static_check.
    METHODS insert_different_fourth_card FOR TESTING RAISING cx_static_check.
    METHODS insert_multiple_cards FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltc_insert_card_at_bottom IMPLEMENTATION.

  METHOD setup.
    cut = NEW #( ).
  ENDMETHOD.


  METHOD insert_second_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->insert_item_at_bottom( stack    = stack( `1` )
                                        new_card = 5 )
      exp = stack( `5 1` ) ).
  ENDMETHOD.


  METHOD insert_third_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->insert_item_at_bottom( stack    = stack( `5 1` )
                                        new_card = 9 )
      exp = stack( `9 5 1` ) ).
  ENDMETHOD.


  METHOD insert_fourth_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->insert_item_at_bottom( stack    = stack( `9 5 1` )
                                        new_card = 2 )
      exp = stack( `2 9 5 1` ) ).
  ENDMETHOD.


  METHOD insert_different_fourth_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->insert_item_at_bottom( stack    = stack( `9 5 1` )
                                        new_card = 8 )
      exp = stack( `8 9 5 1` ) ).
  ENDMETHOD.


  METHOD insert_multiple_cards.
    DATA(stack) = stack( '1' ).

    stack = cut->insert_item_at_bottom( stack    = stack
                                        new_card = 5 ).
    stack = cut->insert_item_at_bottom( stack    = stack
                                        new_card = 9 ).

    cl_abap_unit_assert=>assert_equals(
      act = stack
      exp = stack( `9 5 1` ) ).
  ENDMETHOD.

ENDCLASS.


CLASS ltc_check_length DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS
  INHERITING FROM lth_stack_tester.

  PRIVATE SECTION.

    METHODS setup.
    METHODS empty_table FOR TESTING RAISING cx_static_check.
    METHODS one_card FOR TESTING RAISING cx_static_check.
    METHODS multiple_cards FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltc_check_length IMPLEMENTATION.

  METHOD setup.
    cut = NEW #( ).
  ENDMETHOD.


  METHOD empty_table.
    cl_abap_unit_assert=>assert_equals(
      act = cut->get_size_of_stack( VALUE #( ) )
      exp = 0 ).
  ENDMETHOD.


  METHOD one_card.
    cl_abap_unit_assert=>assert_equals(
      act = cut->get_size_of_stack( stack( '1' ) )
      exp = 1 ).
  ENDMETHOD.


  METHOD multiple_cards.
    cl_abap_unit_assert=>assert_equals(
      act = cut->get_size_of_stack( stack( '2 3 5' ) )
      exp = 3 ).
  ENDMETHOD.

ENDCLASS.
