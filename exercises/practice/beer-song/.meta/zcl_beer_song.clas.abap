CLASS zcl_beer_song DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS recite
      IMPORTING
        !initial_bottles_count TYPE i
        !take_down_count       TYPE i
      RETURNING
        VALUE(result)          TYPE string_table.

  PROTECTED SECTION.
  PRIVATE SECTION.

    METHODS bottles
      IMPORTING
        !count        TYPE i
        !prefix       TYPE c DEFAULT 'n'
        !wall         TYPE c DEFAULT 'y'
      RETURNING
        VALUE(result) TYPE string.
ENDCLASS.



CLASS zcl_beer_song IMPLEMENTATION.

  METHOD bottles.
    result = |{ COND #( WHEN count = 0 THEN |{ prefix }o more | ELSE count ) }|
          && |bottle{ COND #( WHEN count <> 1 THEN `s` ) } of beer|
          && |{ COND #( WHEN wall = 'y' THEN ' on the wall' ) }|.
  ENDMETHOD.

  METHOD recite.

    INSERT |{ bottles( count = initial_bottles_count prefix = 'N' ) },|
      && | { bottles( count = initial_bottles_count wall = 'N' ) }.|
      INTO TABLE result.

    IF initial_bottles_count = 0.
      INSERT |Go to the store and buy some more, { bottles( 99 ) }.|
        INTO TABLE result.
    ELSE.
      INSERT |Take { COND #( WHEN initial_bottles_count = 1 THEN `it` ELSE `one` ) } down and pass it around,|
        && | { bottles( initial_bottles_count - 1 ) }.|
        INTO TABLE result.
    ENDIF.

    IF take_down_count > 1.
      INSERT || INTO TABLE result.
      INSERT LINES OF recite(
        initial_bottles_count = initial_bottles_count - 1
        take_down_count       = take_down_count - 1 ) INTO TABLE result.
    ENDIF.

  ENDMETHOD.
ENDCLASS.