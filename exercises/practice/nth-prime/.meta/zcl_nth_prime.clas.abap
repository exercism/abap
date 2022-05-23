CLASS zcl_nth_prime DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS prime
      IMPORTING
        input         TYPE i
      RETURNING
        VALUE(result) TYPE i
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_nth_prime IMPLEMENTATION.
  METHOD prime.
    IF input = 0.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
    DATA int_list TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    DATA int_list_result TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    DATA max TYPE int8.
    DATA prime_number TYPE int8.
    DATA(times) = input * input.
    IF times <= 1.
      times = 2.
    ENDIF.
    DO times TIMES.
      APPEND sy-tabix + 1 TO int_list.
    ENDDO.
    DELETE int_list INDEX 1.
    int_list_result = int_list.
    prime_number = 2.
    max = input * input.
    WHILE prime_number * prime_number < max.
      LOOP AT int_list ASSIGNING FIELD-SYMBOL(<integer>).
        IF <integer> MOD prime_number = 0 AND <integer> <> prime_number.
          DELETE int_list_result WHERE table_line = <integer>.
        ENDIF.
      ENDLOOP.
      prime_number = prime_number + 1.
    ENDWHILE.
    result = int_list_result[ input ].
  ENDMETHOD.


ENDCLASS.