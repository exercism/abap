CLASS ltc_test DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.

    DATA cut TYPE REF TO zcl_minesweeper.

    METHODS setup.
    METHODS assert_that IMPORTING input  TYPE string_table
                                  output TYPE string_table.

    METHODS no_rows                       FOR TESTING RAISING cx_static_check.
    METHODS no_columns                    FOR TESTING RAISING cx_static_check.
    METHODS no_mines                      FOR TESTING RAISING cx_static_check.
    METHODS only_mines                    FOR TESTING RAISING cx_static_check.
    METHODS mine_surrounded_by_spaces     FOR TESTING RAISING cx_static_check.
    METHODS space_surrounded_by_mines     FOR TESTING RAISING cx_static_check.
    METHODS horizontal_line               FOR TESTING RAISING cx_static_check.
    METHODS horizontal_line_mines_at_ends FOR TESTING RAISING cx_static_check.
    METHODS vertical_line                 FOR TESTING RAISING cx_static_check.
    METHODS vertical_line_mines_at_ends   FOR TESTING RAISING cx_static_check.
    METHODS cross                         FOR TESTING RAISING cx_static_check.
    METHODS large_minefield               FOR TESTING RAISING cx_static_check.

ENDCLASS.


CLASS ltc_test IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_minesweeper( ).
  ENDMETHOD.


  METHOD no_rows.
    assert_that(
      input  = VALUE #( )
      output = VALUE #( ) ).
  ENDMETHOD.


  METHOD no_columns.
    assert_that(
      input  = VALUE #( ( ) )
      output = VALUE #( ( ) ) ).
  ENDMETHOD.


  METHOD no_mines.
    assert_that(
      input  = VALUE #(
        ( `   ` )
        ( `   ` )
        ( `   ` ) )
      output = VALUE #(
        ( `   ` )
        ( `   ` )
        ( `   ` ) ) ).
  ENDMETHOD.


  METHOD only_mines.
    assert_that(
      input  = VALUE #(
        ( `***` )
        ( `***` )
        ( `***` ) )
      output = VALUE #(
        ( `***` )
        ( `***` )
        ( `***` ) ) ).
  ENDMETHOD.


  METHOD mine_surrounded_by_spaces.
    assert_that(
      input  = VALUE #(
        ( `   ` )
        ( ` * ` )
        ( `   ` ) )
      output = VALUE #(
        ( `111` )
        ( `1*1` )
        ( `111` ) ) ).
  ENDMETHOD.


  METHOD space_surrounded_by_mines.
    assert_that(
      input  = VALUE #(
        ( `***` )
        ( `* *` )
        ( `***` ) )
      output = VALUE #(
        ( `***` )
        ( `*8*` )
        ( `***` ) ) ).
  ENDMETHOD.


  METHOD horizontal_line.
    assert_that(
      input  = VALUE #( ( ` * * ` ) )
      output = VALUE #( ( `1*2*1` ) ) ).
  ENDMETHOD.


  METHOD horizontal_line_mines_at_ends.
    assert_that(
      input  = VALUE #( ( `*   *` ) )
      output = VALUE #( ( `*1 1*` ) ) ).
  ENDMETHOD.


  METHOD vertical_line.
    assert_that(
      input  = VALUE #(
        ( ` ` )
        ( `*` )
        ( ` ` )
        ( `*` )
        ( ` ` ) )
      output = VALUE #(
        ( `1` )
        ( `*` )
        ( `2` )
        ( `*` )
        ( `1` ) ) ).
  ENDMETHOD.


  METHOD vertical_line_mines_at_ends.
    assert_that(
      input  = VALUE #(
        ( `*` )
        ( ` ` )
        ( ` ` )
        ( ` ` )
        ( `*` ) )
      output = VALUE #(
        ( `*` )
        ( `1` )
        ( ` ` )
        ( `1` )
        ( `*` ) ) ).
  ENDMETHOD.


  METHOD cross.
    assert_that(
      input  = VALUE #(
        ( `  *  ` )
        ( `  *  ` )
        ( `*****` )
        ( `  *  ` )
        ( `  *  ` ) )
      output = VALUE #(
        ( ` 2*2 ` )
        ( `25*52` )
        ( `*****` )
        ( `25*52` )
        ( ` 2*2 ` ) ) ).
  ENDMETHOD.


  METHOD large_minefield.
    assert_that(
      input  = VALUE #(
        ( ` *  * ` )
        ( `  *   ` )
        ( `    * ` )
        ( `   * *` )
        ( ` *  * ` )
        ( `      ` ) )
      output = VALUE #(
        ( `1*22*1` )
        ( `12*322` )
        ( ` 123*2` )
        ( `112*4*` )
        ( `1*22*2` )
        ( `111111` ) ) ).
  ENDMETHOD.


  METHOD assert_that.
    DATA(act) = cut->annotate( input ).
    cl_abap_unit_assert=>assert_equals( act = act
                                        exp = output ).
  ENDMETHOD.

ENDCLASS.