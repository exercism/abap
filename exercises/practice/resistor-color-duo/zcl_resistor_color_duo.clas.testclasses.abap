*"* use this source file for your ABAP unit test classes
CLASS ltcl_resistor_color_duo DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_resistor_color_duo.
    METHODS setup.
    METHODS:
      test_brown_and_black FOR TESTING,
      test_blue_and_grey FOR TESTING,
      test_yellow_and_violet FOR TESTING,
      test_white_and_red FOR TESTING,
      test_orange_and_orange FOR TESTING,
      test_ignore_additional_colors FOR TESTING,
      test_black_and_brown_one_digit FOR TESTING.
ENDCLASS.

CLASS ltcl_resistor_color_duo IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_resistor_color_duo( ).
  ENDMETHOD.

  METHOD test_brown_and_black.
    DATA(colors) = VALUE string_table( ( `brown` ) ( `black` ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->value( colors )
      exp = 10 ).
  ENDMETHOD.

  METHOD test_blue_and_grey.
    DATA(colors) = VALUE string_table( ( `blue` ) ( `grey` ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->value( colors )
      exp = 68 ).
  ENDMETHOD.

  METHOD test_yellow_and_violet.
    DATA(colors) = VALUE string_table( ( `yellow` ) ( `violet` ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->value( colors )
      exp = 47 ).
  ENDMETHOD.

  METHOD test_white_and_red.
    DATA(colors) = VALUE string_table( ( `white` ) ( `red` ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->value( colors )
      exp = 92 ).
  ENDMETHOD.

  METHOD test_orange_and_orange.
    DATA(colors) = VALUE string_table( ( `orange` ) ( `orange` ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->value( colors )
      exp = 33 ).
  ENDMETHOD.

  METHOD test_ignore_additional_colors.
    DATA(colors) = VALUE string_table( ( `green` ) ( `brown` ) ( `orange` ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->value( colors )
      exp = 51 ).
  ENDMETHOD.

  METHOD test_black_and_brown_one_digit.
    DATA(colors) = VALUE string_table( ( `black` ) ( `brown` ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->value( colors )
      exp = 1 ).
  ENDMETHOD.

ENDCLASS.
