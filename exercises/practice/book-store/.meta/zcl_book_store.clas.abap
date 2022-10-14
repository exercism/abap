CLASS zcl_book_store DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    "! ID of book to buy from 1 to 5
    TYPES book_id TYPE i.

    TYPES basket_type TYPE SORTED TABLE OF book_id
      WITH NON-UNIQUE KEY table_line.

    TYPES total TYPE p LENGTH 3 DECIMALS 2.

    "! @parameter basket | E.g., buying two copies of the first book and one copy of the second book
    "!                     is equivalent to ( ( 1 ) ( 1 ) ( 2 ) )
    METHODS calculate_total
      IMPORTING basket       TYPE basket_type
      RETURNING VALUE(total) TYPE total.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_book_store IMPLEMENTATION.

  METHOD calculate_total.

    TYPES: BEGIN OF basket_aggr_line,
             book_id  TYPE book_id,
             quantity TYPE i,
           END OF basket_aggr_line.
    DATA b TYPE REF TO basket_aggr_line.
    DATA basket_aggr TYPE TABLE OF basket_aggr_line
      WITH NON-UNIQUE SORTED KEY quantity COMPONENTS quantity.

    DATA basket_line TYPE REF TO book_id.

    DATA filtered_basket_aggr LIKE basket_aggr.

    TYPES: BEGIN OF discount_grp,
             unique_books TYPE i,
             discount     TYPE total,
           END OF discount_grp.
    DATA grp TYPE REF TO discount_grp.
    DATA discount_grps TYPE TABLE OF discount_grp.
    discount_grps = VALUE #( ( unique_books = 5 discount = '.25' )
                             ( unique_books = 4 discount = '.20' )
                             ( unique_books = 3 discount = '.10' )
                             ( unique_books = 2 discount = '.05' )
                             ( unique_books = 1 discount = 0 ) ).

    DATA new_total TYPE total.
    total = 999.
    DATA(max_grp) = 5.

    DO 5 TIMES.

      new_total = 0.
      basket_aggr = VALUE #( ( book_id = 1 )
                             ( book_id = 2 )
                             ( book_id = 3 )
                             ( book_id = 4 )
                             ( book_id = 5 ) ).

      LOOP AT basket REFERENCE INTO basket_line.
        basket_aggr[ book_id = basket_line->* ]-quantity += 1.
      ENDLOOP.

      LOOP AT discount_grps REFERENCE INTO grp WHERE unique_books <= max_grp.

        DO.
          CLEAR filtered_basket_aggr.
          LOOP AT basket_aggr REFERENCE INTO b WHERE quantity > 0.
            APPEND b->* TO filtered_basket_aggr.
          ENDLOOP.
          IF lines( filtered_basket_aggr ) < grp->unique_books.
            EXIT.
          ENDIF.
          SORT basket_aggr BY quantity DESCENDING.
          DO grp->unique_books TIMES.
            basket_aggr[ sy-index ]-quantity -= 1.
          ENDDO.
          new_total += grp->unique_books * 8 * ( 1 - grp->discount ).
        ENDDO.
      ENDLOOP.

      total = nmin( val1 = total val2 = new_total ).
      max_grp -= 1.

    ENDDO.

  ENDMETHOD.

ENDCLASS.
