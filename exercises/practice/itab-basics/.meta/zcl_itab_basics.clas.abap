CLASS zcl_itab_basics DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .


  PUBLIC SECTION.
    TYPES group TYPE c LENGTH 1.
    TYPES: BEGIN OF initial_type,
             group       TYPE group,
             number      TYPE i,
             description TYPE string,
           END OF initial_type,
           itab_data_type TYPE STANDARD TABLE OF initial_type WITH EMPTY KEY.

    METHODS fill_itab
      RETURNING
        VALUE(initial_data) TYPE itab_data_type.

    METHODS add_to_itab
      RETURNING
        VALUE(updated_data) TYPE itab_data_type.

    METHODS sort_itab
      RETURNING
        VALUE(updated_data) TYPE itab_data_type.

    METHODS search_itab
      RETURNING
        VALUE(result_index) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_itab_basics IMPLEMENTATION.
  METHOD fill_itab.
    initial_data = VALUE #(
         ( group = 'A' number = 10  description = 'Group A-2' )
         ( group = 'B' number = 5   description = 'Group B' )
         ( group = 'A' number = 6   description = 'Group A-1' )
         ( group = 'C' number = 22  description = 'Group C-1' )
         ( group = 'A' number = 13  description = 'Group A-3' )
         ( group = 'C' number = 500 description = 'Group C-2' ) ).
  ENDMETHOD.

  METHOD add_to_itab.
    updated_data = fill_itab( ).
    APPEND
      VALUE #( group = 'A' number = 19  description = 'Group A-4' )
      TO updated_data.
  ENDMETHOD.

  METHOD sort_itab.
    updated_data = add_to_itab( ).
    SORT updated_data BY group ASCENDING number DESCENDING.
  ENDMETHOD.

  METHOD search_itab.
    DATA(temp_data) = sort_itab( ).
    READ TABLE temp_data WITH KEY number = 6 TRANSPORTING NO FIELDS.
    if sy-subrc = 0.
     result_index = sy-tabix.
    endif.
  ENDMETHOD.

ENDCLASS.