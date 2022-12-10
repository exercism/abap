CLASS zcl_knapsack DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES: BEGIN OF item_type,
             weight TYPE i,
             value  TYPE i,
           END OF item_type.
    TYPES items_type TYPE TABLE OF item_type.

    METHODS get_max_possible_value
      IMPORTING weight_limit     TYPE i
                items            TYPE items_type
      RETURNING VALUE(max_value) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_knapsack IMPLEMENTATION.


  METHOD get_max_possible_value.

    TYPES int_table TYPE STANDARD TABLE OF i WITH NON-UNIQUE KEY table_line.
    DATA matrix TYPE STANDARD TABLE OF int_table.

    " Implementation of dynamic programming approach
    " https://en.wikipedia.org/wiki/Knapsack_problem#0-1_knapsack_problem

    DO lines( items ) + 1 TIMES.
      APPEND VALUE #( ) TO matrix REFERENCE INTO DATA(item_line).
      DO weight_limit + 1 TIMES.
        APPEND VALUE #( ) TO item_line->*.
      ENDDO.
    ENDDO.

    DATA i TYPE i VALUE 2.
    DATA j TYPE i.

    DO lines( items ) TIMES.
      j = 1.
      DO weight_limit + 1 TIMES.
        matrix[ i ][ j ] = nmax( val1 = matrix[ i - 1 ][ j ]  " current item not included
                                 val2 = COND i( WHEN items[ i - 1 ]-weight <= j - 1  " weight limit met?
                                                THEN matrix[ i - 1 ][ j - items[ i - 1 ]-weight ]  " item included
                                                     + items[ i - 1 ]-value
                                                ELSE 0 ) ).  " weight limit exceeded
        j += 1.
      ENDDO.
      i += 1.
    ENDDO.

    max_value = matrix[ lines( items ) + 1 ][ weight_limit + 1 ].

  ENDMETHOD.
ENDCLASS.
