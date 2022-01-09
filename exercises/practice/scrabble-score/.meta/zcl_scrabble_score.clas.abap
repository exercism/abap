CLASS zcl_scrabble_score DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS score
      IMPORTING
        input         TYPE string OPTIONAL
      RETURNING
        VALUE(result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_scrabble_score IMPLEMENTATION.
  METHOD score.
  " create scoring table
    TYPES: BEGIN OF ty_scoring_line,
             letter TYPE string,
             value  TYPE i,
           END OF ty_scoring_line,
           ty_scoring_table TYPE TABLE OF ty_scoring_line WITH EMPTY KEY.
    DATA(scoring_table) = VALUE ty_scoring_table( ( letter = 'A' value = 1 )
                                                  ( letter = 'E' value = 1 )
                                                  ( letter = 'I' value = 1 )
                                                  ( letter = 'O' value = 1 )
                                                  ( letter = 'U' value = 1 )
                                                  ( letter = 'L' value = 1 )
                                                  ( letter = 'N' value = 1 )
                                                  ( letter = 'R' value = 1 )
                                                  ( letter = 'S' value = 1 )
                                                  ( letter = 'T' value = 1 )
                                                  ( letter = 'D' value = 2 )
                                                  ( letter = 'G' value = 2 )
                                                  ( letter = 'B' value = 3 )
                                                  ( letter = 'C' value = 3 )
                                                  ( letter = 'M' value = 3 )
                                                  ( letter = 'P' value = 3 )
                                                  ( letter = 'F' value = 4 )
                                                  ( letter = 'H' value = 4 )
                                                  ( letter = 'V' value = 4 )
                                                  ( letter = 'W' value = 4 )
                                                  ( letter = 'Y' value = 4 )
                                                  ( letter = 'K' value = 5 )
                                                  ( letter = 'J' value = 8 )
                                                  ( letter = 'X' value = 8 )
                                                  ( letter = 'Q' value = 10 )
                                                  ( letter = 'Z' value = 10 ) ).
    DATA(offset) = 0.
    WHILE offset < strlen( input ).
      DATA(letter) = input+offset(1).
      DATA(letter_upper) = to_upper( letter ).
      READ TABLE scoring_table WITH KEY letter = letter_upper INTO DATA(scoring_line).
      result = result + scoring_line-value.
      offset = offset + 1.
    ENDWHILE.


  ENDMETHOD.

ENDCLASS.