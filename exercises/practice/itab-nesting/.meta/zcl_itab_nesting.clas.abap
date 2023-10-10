CLASS zcl_itab_nesting DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: BEGIN OF artists_type,
             artist_id   TYPE string,
             artist_name TYPE string,
           END OF artists_type.
    TYPES artists TYPE STANDARD TABLE OF artists_type WITH KEY artist_id.
    TYPES: BEGIN OF albums_type,
             artist_id  TYPE string,
             album_id   TYPE string,
             album_name TYPE string,
           END OF albums_type.
    TYPES albums TYPE STANDARD TABLE OF albums_type WITH KEY artist_id album_id.
    TYPES: BEGIN OF songs_type,
             artist_id TYPE string,
             album_id  TYPE string,
             song_id   TYPE string,
             song_name TYPE string,
           END OF songs_type.
    TYPES songs TYPE STANDARD TABLE OF songs_type WITH KEY artist_id album_id song_id.


    TYPES: BEGIN OF song_nested_type,
             song_id   TYPE string,
             song_name TYPE string,
           END OF song_nested_type.
    TYPES: BEGIN OF album_song_nested_type,
             album_id   TYPE string,
             album_name TYPE string,
             songs      TYPE STANDARD TABLE OF song_nested_type WITH KEY song_id,
           END OF album_song_nested_type.
    TYPES: BEGIN OF artist_album_nested_type,
             artist_id   TYPE string,
             artist_name TYPE string,
             albums      TYPE STANDARD TABLE OF album_song_nested_type WITH KEY album_id,
           END OF artist_album_nested_type.
    TYPES nested_data TYPE STANDARD TABLE OF artist_album_nested_type WITH KEY artist_id.

    METHODS perform_nesting
      IMPORTING
        artists            TYPE artists
        albums             TYPE albums
        songs              TYPE songs
      RETURNING
        VALUE(nested_data) TYPE nested_data.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_itab_nesting IMPLEMENTATION.

  METHOD perform_nesting.

    LOOP AT artists REFERENCE INTO DATA(artist).
      APPEND INITIAL LINE TO nested_data REFERENCE INTO DATA(nested_lvl1).
      nested_lvl1->artist_id = artist->artist_id.
      nested_lvl1->artist_name = artist->artist_name.

      LOOP AT albums REFERENCE INTO DATA(album)
                              WHERE artist_id = artist->artist_id.
        APPEND INITIAL LINE TO nested_lvl1->albums REFERENCE INTO DATA(nested_lvl2).
        nested_lvl2->album_id = album->album_id.
        nested_lvl2->album_name = album->album_name.

        LOOP AT songs REFERENCE INTO DATA(song)
                               WHERE artist_id = album->artist_id
                                 AND album_id = album->album_id.

          APPEND INITIAL LINE TO nested_lvl2->songs REFERENCE INTO DATA(nested_lvl3).
          nested_lvl3->song_id = song->song_id.
          nested_lvl3->song_name = song->song_name.


        ENDLOOP.

      ENDLOOP.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.