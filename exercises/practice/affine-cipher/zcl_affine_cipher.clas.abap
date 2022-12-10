CLASS zcl_affine_cipher DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF key,
             a TYPE i,
             b TYPE i,
           END OF key.

    METHODS:
      encode IMPORTING phrase        TYPE string
                       key           TYPE key
             RETURNING VALUE(cipher) TYPE string
             RAISING   cx_parameter_invalid,
      decode IMPORTING cipher        TYPE string
                       key           TYPE key
             RETURNING VALUE(phrase) TYPE string
             RAISING   cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_affine_cipher IMPLEMENTATION.
  METHOD encode.
    "Implement solution
  ENDMETHOD.

  METHOD decode.
    "Implement solution
  ENDMETHOD.

ENDCLASS.
