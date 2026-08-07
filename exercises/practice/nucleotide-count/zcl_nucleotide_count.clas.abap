CLASS zcl_nucleotide_count DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES:
      BEGIN OF count_by_nucleotide,
        nucleotide TYPE c LENGTH 1,
        count      TYPE i,
      END OF count_by_nucleotide,
      ty_nucleotide_counts TYPE STANDARD TABLE OF count_by_nucleotide WITH KEY nucleotide.
    METHODS nucleotide_counts
      IMPORTING
        strand        TYPE string
      RETURNING
        VALUE(result) TYPE ty_nucleotide_counts
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_nucleotide_count IMPLEMENTATION.
  METHOD nucleotide_counts.
    " add solution here
  ENDMETHOD.


ENDCLASS.
