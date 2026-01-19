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
    DATA basket_aggr TYPE TABLE OF basket_aggr_line
        WITH NON-UNIQUE SORTED KEY quantity COMPONENTS quantity.

    TYPES: BEGIN OF discount_grp,
             unique_books TYPE i,
             discount            TYPE total,
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
      basket_aggr = VALUE #( FOR i = 1 UNTIL i > 5
                             ( book_id = i
                               quantity = lines( FILTER #( basket WHERE table_line = i ) ) ) ).

      LOOP AT discount_grps REFERENCE INTO grp WHERE unique_books <= max_grp.
        WHILE lines( FILTER #( basket_aggr USING KEY quantity WHERE quantity > 0 ) ) >= grp->unique_books.
          SORT basket_aggr BY quantity DESCENDING.
          DO grp->unique_books TIMES.
            basket_aggr[ sy-index ]-quantity -= 1.
          ENDDO.
          new_total += grp->unique_books * 8 * ( 1 - grp->discount ).
        ENDWHILE.
      ENDLOOP.

      total = nmin( val1 = total val2 = new_total ).
      max_grp -= 1.

    ENDDO.

  ENDMETHOD.

ENDCLASS.
