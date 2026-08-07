CLASS ltcl_line_up DEFINITION FOR TESTING DURATION SHORT RISK LEVEL HARMLESS FINAL.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_line_up.
    METHODS setup.
    METHODS:
      test_4 FOR TESTING,
      test_9 FOR TESTING,
      test_1 FOR TESTING,
      test_2 FOR TESTING,
      test_3 FOR TESTING,
      test_11 FOR TESTING,
      test_12 FOR TESTING,
      test_13 FOR TESTING,
      test_21 FOR TESTING,
      test_100 FOR TESTING.
ENDCLASS.

CLASS ltcl_line_up IMPLEMENTATION.
  METHOD setup.
    cut = NEW zcl_line_up( ).
  ENDMETHOD.

  METHOD test_4.
    cl_abap_unit_assert=>assert_equals(
      exp = 'Gianna, you are the 4th customer we serve today. Thank you!'
      act = cut->format( name = 'Gianna' number = 4 ) ).
  ENDMETHOD.

  METHOD test_9.
    cl_abap_unit_assert=>assert_equals(
      exp = 'Maarten, you are the 9th customer we serve today. Thank you!'
      act = cut->format( name = 'Maarten' number = 9 ) ).
  ENDMETHOD.

  METHOD test_1.
    cl_abap_unit_assert=>assert_equals(
      exp = 'Mary, you are the 1st customer we serve today. Thank you!'
      act = cut->format( name = 'Mary' number = 1 ) ).
  ENDMETHOD.

  METHOD test_2.
    cl_abap_unit_assert=>assert_equals(
      exp = 'Haruto, you are the 2nd customer we serve today. Thank you!'
      act = cut->format( name = 'Haruto' number = 2 ) ).
  ENDMETHOD.

  METHOD test_3.
    cl_abap_unit_assert=>assert_equals(
      exp = 'Henriette, you are the 3rd customer we serve today. Thank you!'
      act = cut->format( name = 'Henriette' number = 3 ) ).
  ENDMETHOD.

  METHOD test_11.
    cl_abap_unit_assert=>assert_equals(
      exp = 'Jacqueline, you are the 11th customer we serve today. Thank you!'
      act = cut->format( name = 'Jacqueline' number = 11 ) ).
  ENDMETHOD.

  METHOD test_12.
    cl_abap_unit_assert=>assert_equals(
      exp = 'Juan, you are the 12th customer we serve today. Thank you!'
      act = cut->format( name = 'Juan' number = 12 ) ).
  ENDMETHOD.

  METHOD test_13.
    cl_abap_unit_assert=>assert_equals(
      exp = 'Patricia, you are the 13th customer we serve today. Thank you!'
      act = cut->format( name = 'Patricia' number = 13 ) ).
  ENDMETHOD.

  METHOD test_21.
    cl_abap_unit_assert=>assert_equals(
      exp = 'Washi, you are the 21st customer we serve today. Thank you!'
      act = cut->format( name = 'Washi' number = 21 ) ).
  ENDMETHOD.

  METHOD test_100.
    cl_abap_unit_assert=>assert_equals(
      exp = 'John, you are the 100th customer we serve today. Thank you!'
      act = cut->format( name = 'John' number = 100 ) ).
  ENDMETHOD.

ENDCLASS.
