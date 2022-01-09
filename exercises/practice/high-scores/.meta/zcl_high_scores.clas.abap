CLASS zcl_high_scores DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES integertab TYPE STANDARD TABLE OF i WITH EMPTY KEY.

    METHODS constructor
      IMPORTING
        scores TYPE integertab.

    METHODS list_scores
      RETURNING
        VALUE(result) TYPE integertab.

    METHODS latest
      RETURNING
        VALUE(result) TYPE i.

    METHODS personalbest
      RETURNING
        VALUE(result) TYPE i.

    METHODS personaltopthree
      RETURNING
        VALUE(result) TYPE integertab.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA scores_list TYPE integertab.

ENDCLASS.


CLASS zcl_high_scores IMPLEMENTATION.

  METHOD constructor.
    scores_list = scores.
  ENDMETHOD.

  METHOD list_scores.
    result = scores_list.
  ENDMETHOD.

  METHOD latest.
    result = scores_list[ lines( scores_list ) ].
  ENDMETHOD.

  METHOD personalbest.
    LOOP AT scores_list ASSIGNING FIELD-SYMBOL(<score>).
      IF <score> > result.
        result = <score>.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD personaltopthree.
    DATA(scores) = scores_list.
    SORT scores BY table_line DESCENDING.
    LOOP AT scores ASSIGNING FIELD-SYMBOL(<score>).
      IF sy-tabix > 3.
        EXIT.
      ENDIF.
      APPEND <score> TO result.

    ENDLOOP.

  ENDMETHOD.


ENDCLASS.