CLASS ltcl_itab_nesting DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.
  PRIVATE SECTION.
    DATA cut TYPE REF TO zcl_itab_nesting.
    METHODS setup.
    METHODS test_empty_input FOR TESTING RAISING cx_static_check.
    METHODS test_single_artist FOR TESTING RAISING cx_static_check.
    METHODS test_single_artist_no_album FOR TESTING RAISING cx_static_check.
    METHODS test_nesting FOR TESTING RAISING cx_static_check.
ENDCLASS.
CLASS ltcl_itab_nesting IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_itab_nesting( ).
  ENDMETHOD.

  METHOD test_empty_input.
    cl_abap_unit_assert=>assert_equals(
      act = cut->perform_nesting( artists = VALUE #( )
                                  albums = VALUE #( )
                                  songs = VALUE #( ) )
      exp = VALUE zcl_itab_nesting=>nested_data( ) ).
  ENDMETHOD.

  METHOD test_single_artist.
    cl_abap_unit_assert=>assert_equals(
      act = cut->perform_nesting(
        artists     = VALUE #( ( artist_id = '1' artist_name = 'Godsmack' ) )
        albums      = VALUE #( ( artist_id = '1' album_id = '1' album_name = 'Faceless' ) )
        songs       = VALUE #( ( artist_id = '1' album_id = '1' song_id = '1' song_name = 'Straight Out Of Line' ) ) )
      exp = VALUE zcl_itab_nesting=>nested_data( ( artist_id = '1' artist_name = 'Godsmack'
                           albums = VALUE #( ( album_id = '1' album_name = 'Faceless'
                                               songs = VALUE #( ( song_id = '1' song_name = 'Straight Out Of Line' ) )
                                             ) )
                                   ) ) ).
  ENDMETHOD.

  METHOD test_single_artist_no_album.
    cl_abap_unit_assert=>assert_equals(
      act = cut->perform_nesting(
        artists     = VALUE #( ( artist_id = '1' artist_name = 'Godsmack' ) )
        albums      = VALUE #( )
        songs       = VALUE #( ) )
      exp = VALUE zcl_itab_nesting=>nested_data( ( artist_id = '1' artist_name = 'Godsmack'
                                        albums = VALUE #( ) ) ) ).
  ENDMETHOD.


  METHOD test_nesting.

    cl_abap_unit_assert=>assert_equals(
      act = cut->perform_nesting(
        artists     = VALUE #( ( artist_id = '1' artist_name = 'Godsmack' )
                                ( artist_id = '2' artist_name = 'Shinedown' ) )
        albums      = VALUE #( ( artist_id = '1' album_id = '1' album_name = 'Faceless' )
                                ( artist_id = '1' album_id = '2' album_name = 'When Lengends Rise' )
                                ( artist_id = '2' album_id = '1' album_name = 'The Sound of Madness' )
                                ( artist_id = '2' album_id = '2' album_name = 'Planet Zero' )
                                )
        songs       = VALUE #( ( artist_id = '1' album_id = '1' song_id = '1' song_name = 'Straight Out Of Line' )
                                ( artist_id = '1' album_id = '1' song_id = '2' song_name = 'Changes' )
                                ( artist_id = '1' album_id = '2' song_id = '1' song_name = 'Bullet Proof' )
                                ( artist_id = '1' album_id = '2' song_id = '2' song_name = 'Under Your Scars' )
                                ( artist_id = '2' album_id = '1' song_id = '1' song_name = 'Second Chance' )
                                ( artist_id = '2' album_id = '1' song_id = '2' song_name = 'Breaking Inside' )
                                ( artist_id = '2' album_id = '2' song_id = '1' song_name = 'Dysfunctional You' )
                                ( artist_id = '2' album_id = '2' song_id = '2' song_name = 'Daylight' )
                                )
             )
       exp = VALUE zcl_itab_nesting=>nested_data(
                 ( artist_id = '1' artist_name = 'Godsmack'
                    albums      = VALUE #( ( album_id = '1' album_name = 'Faceless'
                                         songs       = VALUE #( ( song_id = '1' song_name = 'Straight Out Of Line' )
                                                                ( song_id = '2' song_name = 'Changes' )
                                                                ) )
                                           ( album_id = '2' album_name = 'When Lengends Rise'
                                         songs       = VALUE #( ( song_id = '1' song_name = 'Bullet Proof' )
                                                                ( song_id = '2' song_name = 'Under Your Scars' )
                                                                ) )
                                        ) )
                 ( artist_id = '2' artist_name = 'Shinedown'
                    albums      = VALUE #( ( album_id = '1' album_name = 'The Sound of Madness'
                                          songs       = VALUE #( ( song_id = '1' song_name = 'Second Chance' )
                                                                 ( song_id = '2' song_name = 'Breaking Inside' )
                                                                ) )
                                           ( album_id = '2' album_name = 'Planet Zero'
                                          songs       = VALUE #( ( song_id = '1' song_name = 'Dysfunctional You' )
                                                                 ( song_id = '2' song_name = 'Daylight' )
                                                                ) )
                                        ) )
                                   ) ).

  ENDMETHOD.

ENDCLASS.
