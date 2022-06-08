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
      return_table TYPE STANDARD TABLE OF return_structure WITH KEY word.
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
    DATA(clean) = replace( val = to_lower( phrase )
                           sub = `'`
                           with = ``
                           occ = 0 ).
    clean = replace( val = clean
                     sub = `\n`
                     with = ` `
                     occ = 0 ).
    clean = replace( val = clean
                     sub = `\t`
                     with = ` `
                     occ = 0 ).
    clean = replace( val = clean
                     regex = `[^a-z0-9]`
                     with = ` `
                     occ = 0 ).

    SPLIT condense( clean ) AT ` ` INTO TABLE DATA(words).

    LOOP AT words ASSIGNING FIELD-SYMBOL(<word>).
      DATA(one_result) = VALUE return_structure( word = <word> count = 1 ).
      READ TABLE result ASSIGNING FIELD-SYMBOL(<result>) WITH TABLE KEY word = one_result-word.
      IF sy-subrc = 0.
        <result>-count = <result>-count + one_result-count.
      ELSE.
        INSERT one_result INTO TABLE result.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.