CLASS ltcl_beer_song DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.

  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_beer_song.

    METHODS setup.

      " single verse
    METHODS first_generic_verse FOR TESTING.
    METHODS last_generic_verse FOR TESTING.
    METHODS verse_with_2_bottles FOR TESTING.
    METHODS verse_with_1_bottle FOR TESTING.
    METHODS verse_with_0_bottles FOR TESTING.

      " multiple verses
    METHODS first_two_verses FOR TESTING.
    METHODS last_three_verses FOR TESTING.
    METHODS all_verses FOR TESTING.

ENDCLASS.

CLASS ltcl_beer_song IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_beer_song( ).
  ENDMETHOD.

  METHOD first_generic_verse.
    DATA(exp_result) = VALUE string_table(
        ( |99 bottles of beer on the wall, 99 bottles of beer.| )
        ( |Take one down and pass it around, 98 bottles of beer on the wall.| ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->recite( initial_bottles_count = 99 take_down_count = 1 )
      exp = exp_result ).
  ENDMETHOD.

  METHOD last_generic_verse.
    DATA(exp_result) = VALUE string_table(
        ( |3 bottles of beer on the wall, 3 bottles of beer.| )
        ( |Take one down and pass it around, 2 bottles of beer on the wall.| ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->recite( initial_bottles_count = 3 take_down_count = 1 )
      exp = exp_result ).
  ENDMETHOD.

  METHOD verse_with_2_bottles.
    DATA(exp_result) = VALUE string_table(
        ( |2 bottles of beer on the wall, 2 bottles of beer.| )
        ( |Take one down and pass it around, 1 bottle of beer on the wall.| ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->recite( initial_bottles_count = 2 take_down_count = 1 )
      exp = exp_result ).
  ENDMETHOD.

  METHOD verse_with_1_bottle.
    DATA(exp_result) = VALUE string_table(
        ( |1 bottle of beer on the wall, 1 bottle of beer.| )
        ( |Take it down and pass it around, no more bottles of beer on the wall.| ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->recite( initial_bottles_count = 1 take_down_count = 1 )
      exp = exp_result ).
  ENDMETHOD.

  METHOD verse_with_0_bottles.
    DATA(exp_result) = VALUE string_table(
        ( |No more bottles of beer on the wall, no more bottles of beer.| )
        ( |Go to the store and buy some more, 99 bottles of beer on the wall.| ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->recite( initial_bottles_count = 0 take_down_count = 1 )
      exp = exp_result ).
  ENDMETHOD.

  METHOD first_two_verses.
    DATA(exp_result) = VALUE string_table(
        ( |99 bottles of beer on the wall, 99 bottles of beer.| )
        ( |Take one down and pass it around, 98 bottles of beer on the wall.| )
        ( || )
        ( |98 bottles of beer on the wall, 98 bottles of beer.| )
        ( |Take one down and pass it around, 97 bottles of beer on the wall.| ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->recite( initial_bottles_count = 99 take_down_count = 2 )
      exp = exp_result ).
  ENDMETHOD.

  METHOD last_three_verses.
    DATA(exp_result) = VALUE string_table(
        ( |2 bottles of beer on the wall, 2 bottles of beer.| )
        ( |Take one down and pass it around, 1 bottle of beer on the wall.| )
        ( || )
        ( |1 bottle of beer on the wall, 1 bottle of beer.| )
        ( |Take it down and pass it around, no more bottles of beer on the wall.| )
        ( || )
        ( |No more bottles of beer on the wall, no more bottles of beer.| )
        ( |Go to the store and buy some more, 99 bottles of beer on the wall.| ) ).
    cl_abap_unit_assert=>assert_equals(
      act = cut->recite( initial_bottles_count = 2 take_down_count = 3 )
      exp = exp_result ).
  ENDMETHOD.

  METHOD all_verses.
    cl_abap_unit_assert=>assert_equals(
      act = lines( cut->recite( initial_bottles_count = 99 take_down_count = 100 ) )
      exp = 299 ).
  ENDMETHOD.
ENDCLASS.
