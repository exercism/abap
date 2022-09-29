CLASS zcl_secret_handshake DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_commands
      IMPORTING code            TYPE i
      RETURNING VALUE(commands) TYPE string_table.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_secret_handshake IMPLEMENTATION.

  METHOD get_commands.

    DATA binary_zero TYPE x VALUE 0.
    DATA(binary_code) = CONV xstring( code ).

    DATA(codes_transl) = VALUE string_table(  ( `wink` ) ( `double blink` )  ( `close your eyes` )  ( `jump` ) ).

    LOOP AT codes_transl REFERENCE INTO DATA(command).
      IF CONV xstring( 2 ** ( sy-tabix - 1 ) ) BIT-AND binary_code > binary_zero.
        APPEND command->* TO commands.
      ENDIF.
    ENDLOOP.

    IF binary_code BIT-AND CONV xstring( 16 ) > binary_zero.
      DATA(reversed_commands) = VALUE string_table( FOR line IN commands
                                                    INDEX INTO i
                                                    ( commands[ lines( commands ) - i + 1 ] ) ).
      commands = reversed_commands.
    ENDIF.

  ENDMETHOD.

ENDCLASS.