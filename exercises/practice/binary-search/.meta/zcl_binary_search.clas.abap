CLASS zcl_binary_search DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES
      integertab TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    METHODS binary_search
      IMPORTING
        val           TYPE i
        table         TYPE integertab
      RETURNING
        VALUE(result) TYPE i
      RAISING
        CX_SY_ITAB_LINE_NOT_FOUND.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_binary_search IMPLEMENTATION.

  METHOD binary_search.
    DATA(low) = 1.
    DATA(high) = lines( table ).

    WHILE low <= high.
      DATA(mid) = ( low + high ) DIV 2.
      DATA(mid_val) = table[ mid ].

      IF mid_val < val.
        low = mid + 1.
      ELSEIF mid_val > val.
        high = mid - 1.
      ELSE.
        result = mid.
        RETURN.
      ENDIF.
    ENDWHILE.

    RAISE EXCEPTION TYPE CX_SY_ITAB_LINE_NOT_FOUND.
  ENDMETHOD.
ENDCLASS.
