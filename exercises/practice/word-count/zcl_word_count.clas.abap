CLASS zcl_word_count DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES:
      BEGIN OF return_structure,
        word  TYPE string,
        count TYPE i,
      END OF return_structure,
      return_table TYPE STANDARD TABLE OF return_structure WITH EMPTY KEY.
    METHODS count_words
      IMPORTING
        !phrase       TYPE string
      RETURNING
        VALUE(result) TYPE return_table .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_word_count IMPLEMENTATION.

  METHOD count_words.
    DATA(lv_phrase) = phrase.
    CONDENSE lv_phrase.
    REPLACE ALL OCCURRENCES OF ',' IN lv_phrase WITH ` `.
    REPLACE ALL OCCURRENCES OF '''' IN lv_phrase WITH ''.
    REPLACE ALL OCCURRENCES OF '\n' IN lv_phrase WITH ` `.
    REPLACE ALL OCCURRENCES OF '.' IN lv_phrase WITH ''.
    REPLACE ALL OCCURRENCES OF '!' IN lv_phrase WITH ''.
    REPLACE ALL OCCURRENCES OF ':' IN lv_phrase WITH ''.
    REPLACE ALL OCCURRENCES OF '"' IN lv_phrase WITH ''.
    REPLACE ALL OCCURRENCES OF '&' IN lv_phrase WITH ''.
    REPLACE ALL OCCURRENCES OF '@' IN lv_phrase WITH ''.
    REPLACE ALL OCCURRENCES OF '$' IN lv_phrase WITH ''.
    REPLACE ALL OCCURRENCES OF '%' IN lv_phrase WITH ''.
    REPLACE ALL OCCURRENCES OF '^' IN lv_phrase WITH ''.
    CONDENSE lv_phrase.

    SPLIT lv_phrase AT space INTO TABLE DATA(lt_phrases).

    LOOP AT lt_phrases ASSIGNING FIELD-SYMBOL(<lower_phrase>).
      <lower_phrase> = to_lower( <lower_phrase> ).
    ENDLOOP.
    LOOP AT lt_phrases ASSIGNING FIELD-SYMBOL(<phrase>)
            GROUP BY ( phrase = <phrase>  size  = GROUP SIZE )
            ASSIGNING FIELD-SYMBOL(<phrases>).

      DATA(return_structure) = VALUE return_structure( word = <phrases>-phrase count = <phrases>-size ).
      APPEND return_structure TO result.
    ENDLOOP.


  ENDMETHOD.
ENDCLASS.