CLASS ltc_test DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.

    DATA cut TYPE REF TO zcl_flower_field.

    METHODS setup.
    METHODS assert_that IMPORTING input  TYPE string_table
                                  output TYPE string_table.

    METHODS no_rows                        FOR TESTING RAISING cx_static_check.
    METHODS no_columns                     FOR TESTING RAISING cx_static_check.
    METHODS no_flowers                     FOR TESTING RAISING cx_static_check.
    METHODS garden_full_of_flowers         FOR TESTING RAISING cx_static_check.
    METHODS flower_surrounded_by_spaces    FOR TESTING RAISING cx_static_check.
    METHODS space_surrounded_by_flowers    FOR TESTING RAISING cx_static_check.
    METHODS horizontal_line                FOR TESTING RAISING cx_static_check.
    METHODS horizontal_line_flowers_at_end FOR TESTING RAISING cx_static_check.
    METHODS vertical_line                  FOR TESTING RAISING cx_static_check.
    METHODS vertical_line_flowers_at_end   FOR TESTING RAISING cx_static_check.
    METHODS cross                          FOR TESTING RAISING cx_static_check.
    METHODS large_garden                   FOR TESTING RAISING cx_static_check.

ENDCLASS.


CLASS ltc_test IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_flower_field( ).
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


  METHOD no_flowers.
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


  METHOD garden_full_of_flowers.
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


  METHOD flower_surrounded_by_spaces.
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


  METHOD space_surrounded_by_flowers.
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


  METHOD horizontal_line_flowers_at_end.
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


  METHOD vertical_line_flowers_at_end.
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


  METHOD large_garden.
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
