CLASS zcl_collatz_conjecture DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS ret_steps IMPORTING num          TYPE i
                      RETURNING VALUE(steps) TYPE i
                      RAISING   cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_collatz_conjecture IMPLEMENTATION.
  METHOD ret_steps.
    DATA current_num TYPE i.
    IF num < 1.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    current_num = num.
    WHILE current_num > 1.
      current_num = COND i( WHEN current_num MOD 2 = 0 THEN current_num / 2
                            ELSE current_num * 3 + 1 ).
      steps += 1.
    ENDWHILE.
  ENDMETHOD.
ENDCLASS.
