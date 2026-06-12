*"* use this source file for your ABAP unit test classes
CLASS ltcl_resistor_color_trio DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_resistor_color_trio.
    METHODS setup.
    METHODS:
      test_orange_and_orange_black FOR TESTING,
      test_blue_and_grey_brown FOR TESTING,
      test_red_and_black_red FOR TESTING,
      test_green_and_brown_orange FOR TESTING,
      test_yellow_and_violet_yellow FOR TESTING,
      test_blue_and_violet_blue FOR TESTING,
      test_minimum_possible_value FOR TESTING,
      test_maximum_possible_value FOR TESTING,
      test_invalid_octal FOR TESTING,
      test_ignore_extra_colors FOR TESTING.
ENDCLASS.

CLASS ltcl_resistor_color_trio IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_resistor_color_trio( ).
  ENDMETHOD.

  METHOD test_orange_and_orange_black.
    DATA(input_colors) = VALUE string_table( ( `orange` ) ( `orange` ) ( `black` ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->label( input_colors )
      exp = '33 ohms' ).
  ENDMETHOD.

  METHOD test_blue_and_grey_brown.
    DATA(input_colors) = VALUE string_table( ( `blue` ) ( `grey` ) ( `brown` ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->label( input_colors )
      exp = '680 ohms' ).
  ENDMETHOD.

  METHOD test_red_and_black_red.
    DATA(input_colors) = VALUE string_table( ( `red` ) ( `black` ) ( `red` ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->label( input_colors )
      exp = '2 kiloohms' ).
  ENDMETHOD.

  METHOD test_green_and_brown_orange.
    DATA(input_colors) = VALUE string_table( ( `green` ) ( `brown` ) ( `orange` ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->label( input_colors )
      exp = '51 kiloohms' ).
  ENDMETHOD.

  METHOD test_yellow_and_violet_yellow.
    DATA(input_colors) = VALUE string_table( ( `yellow` ) ( `violet` ) ( `yellow` ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->label( input_colors )
      exp = '470 kiloohms' ).
  ENDMETHOD.

  METHOD test_blue_and_violet_blue.
    DATA(input_colors) = VALUE string_table( ( `blue` ) ( `violet` ) ( `blue` ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->label( input_colors )
      exp = '67 megaohms' ).
  ENDMETHOD.

  METHOD test_minimum_possible_value.
    DATA(input_colors) = VALUE string_table( ( `black` ) ( `black` ) ( `black` ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->label( input_colors )
      exp = '0 ohms' ).
  ENDMETHOD.

  METHOD test_maximum_possible_value.
    DATA(input_colors) = VALUE string_table( ( `white` ) ( `white` ) ( `white` ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->label( input_colors )
      exp = '99 gigaohms' ).
  ENDMETHOD.

  METHOD test_invalid_octal.
    DATA(input_colors) = VALUE string_table( ( `black` ) ( `grey` ) ( `black` ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->label( input_colors )
      exp = '8 ohms' ).
  ENDMETHOD.

  METHOD test_ignore_extra_colors.
    DATA(input_colors) = VALUE string_table( ( `blue` ) ( `green` ) ( `yellow` ) ( `orange` ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->label( input_colors )
      exp = '650 kiloohms' ).
  ENDMETHOD.

ENDCLASS.