CLASS ltcl_book_store DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.

    DATA cut TYPE REF TO zcl_book_store.

    METHODS setup.

    METHODS only_a_single_book FOR TESTING RAISING cx_static_check.
    METHODS two_of_the_same_book FOR TESTING RAISING cx_static_check.
    METHODS empty_basket FOR TESTING RAISING cx_static_check.
    METHODS two_different_books FOR TESTING RAISING cx_static_check.
    METHODS three_different_books FOR TESTING RAISING cx_static_check.
    METHODS four_different_books FOR TESTING RAISING cx_static_check.
    METHODS five_different_books FOR TESTING RAISING cx_static_check.
    "! Two groups of four is cheaper than group of five plus group of three
    METHODS two_groups_of_four_1 FOR TESTING RAISING cx_static_check.
    "! Two groups of four is cheaper than groups of five and three
    METHODS two_groups_of_four_2 FOR TESTING RAISING cx_static_check.
    "! Group of four plus group of two is cheaper than two groups of three
    METHODS group_of_four_and_group_of_two FOR TESTING RAISING cx_static_check.
    "! Two each of first four books and one copy each of rest
    METHODS two_copies_of_each_except_one FOR TESTING RAISING cx_static_check.
    METHODS two_copies_of_each_book FOR TESTING RAISING cx_static_check.
    "! Three copies of first book and two each of remaining
    METHODS three_of_first_two_each_remain FOR TESTING RAISING cx_static_check.
    "! Three each of first two books and two each of remaining books
    METHODS three_of_first_two_two_of_rem FOR TESTING RAISING cx_static_check.
    "! Four groups of four are cheaper than two groups each of five and three
    METHODS four_groups_of_four FOR TESTING RAISING cx_static_check.
    "! Check that groups of four are created properly even when there are more groups of three than groups of five
    METHODS groups_of_four FOR TESTING RAISING cx_static_check.
    "!One group of one and four is cheaper than one group of two and three
    METHODS one_group_of_one_and_four FOR TESTING RAISING cx_static_check.
    "! One group of one and two plus three groups of four is cheaper than one group of each size
    METHODS mixed_1 FOR TESTING RAISING cx_static_check.

ENDCLASS.


CLASS ltcl_book_store IMPLEMENTATION.

  METHOD setup.
    cut = NEW #( ).
  ENDMETHOD.

  METHOD only_a_single_book.
    cl_abap_unit_assert=>assert_equals(
      exp = 8
      act = cut->calculate_total( VALUE #( ( 1 ) ) ) ).
  ENDMETHOD.

  METHOD two_of_the_same_book.
    cl_abap_unit_assert=>assert_equals(
      exp = 16
      act = cut->calculate_total( VALUE #( ( 2 ) ( 2 ) ) ) ).
  ENDMETHOD.

  METHOD empty_basket.
    cl_abap_unit_assert=>assert_equals(
      exp = 0
      act = cut->calculate_total( VALUE #( ) ) ).
  ENDMETHOD.

  METHOD two_different_books.
    cl_abap_unit_assert=>assert_equals(
      exp = '15.2'
      act = cut->calculate_total( VALUE #( ( 1 ) ( 2 ) ) ) ).
  ENDMETHOD.

  METHOD three_different_books.
    cl_abap_unit_assert=>assert_equals(
      exp = '21.6'
      act = cut->calculate_total( VALUE #( ( 1 ) ( 2 ) ( 3 ) ) ) ).
  ENDMETHOD.

  METHOD four_different_books.
    cl_abap_unit_assert=>assert_equals(
      exp = '25.6'
      act = cut->calculate_total( VALUE #( ( 1 ) ( 2 ) ( 3 ) ( 4 ) ) ) ).
  ENDMETHOD.

  METHOD five_different_books.
    cl_abap_unit_assert=>assert_equals(
      exp = '30'
      act = cut->calculate_total( VALUE #( ( 1 ) ( 2 ) ( 3 ) ( 4 ) ( 5 ) ) ) ).
  ENDMETHOD.

  METHOD two_groups_of_four_1.
    cl_abap_unit_assert=>assert_equals(
      exp = '51.2'
      act = cut->calculate_total( VALUE #( ( 1 ) ( 1 )
                                           ( 2 ) ( 2 )
                                           ( 3 ) ( 3 )
                                           ( 4 )
                                           ( 5 ) ) ) ).
  ENDMETHOD.

  METHOD two_groups_of_four_2.
    cl_abap_unit_assert=>assert_equals(
      exp = '51.2'
      act = cut->calculate_total( VALUE #( ( 1 ) ( 1 )
                                           ( 2 )
                                           ( 3 )
                                           ( 4 ) ( 4 )
                                           ( 5 ) ( 5 ) ) ) ).
  ENDMETHOD.

  METHOD group_of_four_and_group_of_two.
    cl_abap_unit_assert=>assert_equals(
      exp = '40.8'
      act = cut->calculate_total( VALUE #( ( 1 ) ( 1 )
                                           ( 2 ) ( 2 )
                                           ( 3 )
                                           ( 4 ) ) ) ).
  ENDMETHOD.

  METHOD two_copies_of_each_except_one.
    cl_abap_unit_assert=>assert_equals(
      exp = '55.6'
      act = cut->calculate_total( VALUE #( ( 1 ) ( 1 )
                                           ( 2 ) ( 2 )
                                           ( 3 ) ( 3 )
                                           ( 4 ) ( 4 )
                                           ( 5 ) ) ) ).
  ENDMETHOD.

  METHOD two_copies_of_each_book.
    cl_abap_unit_assert=>assert_equals(
      exp = 60
      act = cut->calculate_total( VALUE #( ( 1 ) ( 1 )
                                           ( 2 ) ( 2 )
                                           ( 3 ) ( 3 )
                                           ( 4 ) ( 4 )
                                           ( 5 ) ( 5 ) ) ) ).
  ENDMETHOD.

  METHOD three_of_first_two_each_remain.
    cl_abap_unit_assert=>assert_equals(
      exp = 68
      act = cut->calculate_total( VALUE #( ( 1 ) ( 1 )
                                           ( 2 ) ( 2 )
                                           ( 3 ) ( 3 )
                                           ( 4 ) ( 4 )
                                           ( 5 ) ( 5 )
                                           ( 1 ) ) ) ).
  ENDMETHOD.

  METHOD three_of_first_two_two_of_rem.
    cl_abap_unit_assert=>assert_equals(
      exp = '75.2'
      act = cut->calculate_total( VALUE #( ( 1 ) ( 1 )
                                           ( 2 ) ( 2 )
                                           ( 3 ) ( 3 )
                                           ( 4 ) ( 4 )
                                           ( 5 ) ( 5 )
                                           ( 1 )
                                           ( 2 ) ) ) ).
  ENDMETHOD.

  METHOD four_groups_of_four.
    cl_abap_unit_assert=>assert_equals(
      exp = '102.4'
      act = cut->calculate_total( VALUE #( ( 1 ) ( 1 )
                                           ( 2 ) ( 2 )
                                           ( 3 ) ( 3 )
                                           ( 4 )
                                           ( 5 )
                                           ( 1 ) ( 1 )
                                           ( 2 ) ( 2 )
                                           ( 3 ) ( 3 )
                                           ( 4 )
                                           ( 5 ) ) ) ).
  ENDMETHOD.

  METHOD groups_of_four.
    cl_abap_unit_assert=>assert_equals(
      exp = '145.6'
      act = cut->calculate_total( VALUE #( ( 1 ) ( 1 ) ( 1 ) ( 1 ) ( 1 ) ( 1 )
                                           ( 2 ) ( 2 ) ( 2 ) ( 2 ) ( 2 ) ( 2 )
                                           ( 3 ) ( 3 ) ( 3 ) ( 3 ) ( 3 ) ( 3 )
                                           ( 4 ) ( 4 )
                                           ( 5 ) ( 5 ) ) ) ).
  ENDMETHOD.

  METHOD one_group_of_one_and_four.
    cl_abap_unit_assert=>assert_equals(
      exp = '33.6'
      act = cut->calculate_total( VALUE #( ( 1 ) ( 1 )
                                           ( 2 )
                                           ( 3 )
                                           ( 4 ) ) ) ).
  ENDMETHOD.

  METHOD mixed_1.
    cl_abap_unit_assert=>assert_equals(
      exp = 100
      act = cut->calculate_total( VALUE #( ( 1 )
                                           ( 2 ) ( 2 )
                                           ( 3 ) ( 3 ) ( 3 )
                                           ( 4 ) ( 4 ) ( 4 ) ( 4 )
                                           ( 5 ) ( 5 ) ( 5 ) ( 5 ) ( 5 ) ) ) ).
  ENDMETHOD.

ENDCLASS.
