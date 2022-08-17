CLASS ltcl_itab_combination DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.
  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_itab_combination.
    METHODS setup.
    METHODS test_empty_input FOR TESTING RAISING cx_static_check.
    METHODS test_single_row FOR TESTING RAISING cx_static_check.
    METHODS test_combination FOR TESTING RAISING cx_static_check.
ENDCLASS.
CLASS ltcl_itab_combination IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_itab_combination( ).
  ENDMETHOD.

  METHOD test_empty_input.
    cl_abap_unit_assert=>assert_equals(
      act = cut->perform_combination( alphas = VALUE #( )
                                      nums = VALUE #( ) )
      exp = VALUE zcl_itab_combination=>combined_data( ) ).
  ENDMETHOD.

  METHOD test_single_row.

    cl_abap_unit_assert=>assert_equals(
      act = cut->perform_combination(
                     alphas  = VALUE #( ( cola = 'A' colb = 'B' colc = 'C' ) )
                     nums    = VALUE #( ( col1 = '1' col2 = '2' col3 = '3' ) ) )
      exp = VALUE zcl_itab_combination=>combined_data( ( colx = 'A1' coly = 'B2' colz = 'C3' ) ) ).

  ENDMETHOD.

  METHOD test_combination.

    cl_abap_unit_assert=>assert_equals(
      act = cut->perform_combination(
        alphas      = VALUE #( ( cola = 'A' colb = 'B' colc = 'C' )
                          ( cola = 'D' colb = 'E' colc = 'F' )
                          ( cola = 'G' colb = 'H' colc = 'I' )
                        )
        nums        = VALUE #( ( col1 = '1' col2 = '2' col3 = '3' )
                          ( col1 = '4' col2 = '5' col3 = '6' )
                          ( col1 = '7' col2 = '8' col3 = '9' )
                        )
             )
       exp = VALUE zcl_itab_combination=>combined_data( ( colx = 'A1' coly = 'B2' colz = 'C3' )
                          ( colx = 'D4' coly = 'E5' colz = 'F6' )
                          ( colx = 'G7' coly = 'H8' colz = 'I9' )
             ) ).

  ENDMETHOD.

ENDCLASS.
