CLASS ltcl_knapsack DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.

    DATA cut TYPE REF TO zcl_knapsack.

    METHODS setup.

    METHODS no_items FOR TESTING RAISING cx_static_check.
    METHODS one_item_too_heavy FOR TESTING RAISING cx_static_check.
    "! five items (cannot be greedy by weight)
    METHODS five_items_cannot_be_greedy_1 FOR TESTING RAISING cx_static_check.
    "! five items (cannot be greedy by value)
    METHODS five_items_cannot_be_greedy_2 FOR TESTING RAISING cx_static_check.
    METHODS example_knapsack FOR TESTING RAISING cx_static_check.
    METHODS eight_items FOR TESTING RAISING cx_static_check.
    METHODS fifteen_items FOR TESTING RAISING cx_static_check.

ENDCLASS.


CLASS ltcl_knapsack IMPLEMENTATION.

  METHOD setup.
    cut = NEW #( ).
  ENDMETHOD.

  METHOD no_items.
    cl_abap_unit_assert=>assert_equals(
      exp = 0
      act = cut->get_max_possible_value( weight_limit = 100
                                items = VALUE #( ) ) ).
  ENDMETHOD.

  METHOD one_item_too_heavy.
    cl_abap_unit_assert=>assert_equals(
      exp = 0
      act = cut->get_max_possible_value( weight_limit = 10
                                items = VALUE #( ( weight = 100 value = 1 ) ) ) ).
  ENDMETHOD.

  METHOD five_items_cannot_be_greedy_1.
    cl_abap_unit_assert=>assert_equals(
      exp = 21
      act = cut->get_max_possible_value( weight_limit = 10
                                items = VALUE #( ( weight = 2 value = 5 )
                                                 ( weight = 2 value = 5 )
                                                 ( weight = 2 value = 5 )
                                                 ( weight = 2 value = 5 )
                                                 ( weight = 10 value = 21 ) ) ) ).
  ENDMETHOD.

  METHOD five_items_cannot_be_greedy_2.
    cl_abap_unit_assert=>assert_equals(
      exp = 80
      act = cut->get_max_possible_value( weight_limit = 10
                                items = VALUE #( ( weight = 2 value = 20 )
                                                 ( weight = 2 value = 20 )
                                                 ( weight = 2 value = 20 )
                                                 ( weight = 2 value = 20 )
                                                 ( weight = 10 value = 50 ) ) ) ).
  ENDMETHOD.

  METHOD example_knapsack.
    cl_abap_unit_assert=>assert_equals(
      exp = 90
      act = cut->get_max_possible_value( weight_limit = 10
                                items = VALUE #( ( weight = 5 value = 10 )
                                                 ( weight = 4 value = 40 )
                                                 ( weight = 6 value = 30 )
                                                 ( weight = 4 value = 50 ) ) ) ).
  ENDMETHOD.

  METHOD eight_items.
    cl_abap_unit_assert=>assert_equals(
      exp = 900
      act = cut->get_max_possible_value( weight_limit = 104
                                items = VALUE #( ( weight = 25 value = 350 )
                                                 ( weight = 35 value = 400 )
                                                 ( weight = 45 value = 450 )
                                                 ( weight = 5 value = 20 )
                                                 ( weight = 25 value = 70 )
                                                 ( weight = 3 value = 8 )
                                                 ( weight = 2 value = 5 )
                                                 ( weight = 2 value = 5 ) ) ) ).
  ENDMETHOD.

  METHOD fifteen_items.
    cl_abap_unit_assert=>assert_equals(
      exp = 1458
      act = cut->get_max_possible_value( weight_limit = 750
                                items = VALUE #( ( weight = 70 value = 135 )
                                                 ( weight = 73 value = 139 )
                                                 ( weight = 77 value = 149 )
                                                 ( weight = 80 value = 150 )
                                                 ( weight = 82 value = 156 )
                                                 ( weight = 87 value = 163 )
                                                 ( weight = 90 value = 173 )
                                                 ( weight = 94 value = 184 )
                                                 ( weight = 98 value = 192 )
                                                 ( weight = 106 value = 201 )
                                                 ( weight = 110 value = 210 )
                                                 ( weight = 113 value = 214 )
                                                 ( weight = 115 value = 221 )
                                                 ( weight = 118 value = 229 )
                                                 ( weight = 120 value = 240 ) ) ) ).
  ENDMETHOD.

ENDCLASS.
