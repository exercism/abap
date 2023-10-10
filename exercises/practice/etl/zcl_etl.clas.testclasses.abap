CLASS ltcl_etl DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_etl.
    METHODS:
      setup,
      single_letter FOR TESTING,
      single_score_multi_letter FOR TESTING,
      two_score_two_letters FOR TESTING,
      multi_score_multi_letter FOR TESTING.
ENDCLASS.


CLASS ltcl_etl IMPLEMENTATION.
  METHOD setup.
    cut = NEW zcl_etl( ).
  ENDMETHOD.

  METHOD single_letter.
    DATA(inp) = VALUE zcl_etl=>tty_legacy_data(
                  ( number = 1  string = `A` ) ).

    cl_abap_unit_assert=>assert_equals(
      act = cut->transform( inp )
      exp = VALUE zcl_etl=>tty_new_data(
              ( letter = 'a' number = 1 ) ) ).
  ENDMETHOD.

  METHOD single_score_multi_letter.
    DATA(inp) = VALUE zcl_etl=>tty_legacy_data(
                  ( number = 1  string = `A,E,I,O,U` ) ).

    DATA(exp) = VALUE zcl_etl=>tty_new_data(
                  ( letter = 'a' number = 1 )
                  ( letter = 'e' number = 1 )
                  ( letter = 'i' number = 1 )
                  ( letter = 'o' number = 1 )
                  ( letter = 'u' number = 1 ) ).

    cl_abap_unit_assert=>assert_equals(
      act = cut->transform( inp )
      exp = exp ).
  ENDMETHOD.

  METHOD two_score_two_letters.
    DATA(inp) = VALUE zcl_etl=>tty_legacy_data(
                  ( number = 1  string = `A,E` )
                  ( number = 2  string = `D,G` ) ).

    DATA(exp) = VALUE zcl_etl=>tty_new_data(
                  ( letter = 'a' number = 1 )
                  ( letter = 'e' number = 1 )
                  ( letter = 'd' number = 2 )
                  ( letter = 'g' number = 2 ) ).

    cl_abap_unit_assert=>assert_equals(
      act = cut->transform( inp )
      exp = exp ).

  ENDMETHOD.

  METHOD multi_score_multi_letter.
    DATA(inp) = VALUE zcl_etl=>tty_legacy_data(
                  ( number = 1  string = `A,E,I,O,U,L,N,R,S,T` )
                  ( number = 2  string = `D,G` )
                  ( number = 3  string = `B,C,M,P` )
                  ( number = 4  string = `F,H,V,W,Y` )
                  ( number = 5  string = `K` )
                  ( number = 8  string = `J,X` )
                  ( number = 10  string = `Q,Z` ) ).

    DATA(exp) = VALUE zcl_etl=>tty_new_data(
                  ( letter = 'a' number = 1 )
                  ( letter = 'b' number = 3 )
                  ( letter = 'c' number = 3 )
                  ( letter = 'd' number = 2 )
                  ( letter = 'e' number = 1 )
                  ( letter = 'f' number = 4 )
                  ( letter = 'g' number = 2 )
                  ( letter = 'h' number = 4 )
                  ( letter = 'i' number = 1 )
                  ( letter = 'j' number = 8 )
                  ( letter = 'k' number = 5 )
                  ( letter = 'l' number = 1 )
                  ( letter = 'm' number = 3 )
                  ( letter = 'n' number = 1 )
                  ( letter = 'o' number = 1 )
                  ( letter = 'p' number = 3 )
                  ( letter = 'q' number = 10 )
                  ( letter = 'r' number = 1 )
                  ( letter = 's' number = 1 )
                  ( letter = 't' number = 1 )
                  ( letter = 'u' number = 1 )
                  ( letter = 'v' number = 4 )
                  ( letter = 'w' number = 4 )
                  ( letter = 'x' number = 8 )
                  ( letter = 'y' number = 4 )
                  ( letter = 'z' number = 10 ) ).

    cl_abap_unit_assert=>assert_equals(
      act = cut->transform( inp )
      exp = exp ).
  ENDMETHOD.
ENDCLASS.
