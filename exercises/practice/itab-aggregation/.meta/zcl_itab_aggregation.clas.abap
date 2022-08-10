CLASS zcl_itab_aggregation DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES group TYPE c LENGTH 1.
    TYPES: BEGIN OF initial_numbers_type,
             group  TYPE group,
             number TYPE i,
           END OF initial_numbers_type,
           initial_numbers TYPE STANDARD TABLE OF initial_numbers_type WITH EMPTY KEY.

    TYPES: BEGIN OF aggregated_data_type,
             group   TYPE group,
             count   TYPE i,
             sum     TYPE i,
             min     TYPE i,
             max     TYPE i,
             average TYPE f,
           END OF aggregated_data_type,
           aggregated_data TYPE STANDARD TABLE OF aggregated_data_type WITH EMPTY KEY.

    METHODS perform_aggregation
      IMPORTING
        initial_numbers        TYPE initial_numbers
      RETURNING
        VALUE(aggregated_data) TYPE aggregated_data.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_itab_aggregation IMPLEMENTATION.
  METHOD perform_aggregation.
    LOOP AT initial_numbers REFERENCE INTO DATA(initial_number)
        GROUP BY ( key = initial_number->group  count = GROUP SIZE )
        ASCENDING
        REFERENCE INTO DATA(group_key).

      APPEND INITIAL LINE TO aggregated_data REFERENCE INTO DATA(aggregated_item).
      aggregated_item->group = group_key->key.
      aggregated_item->count = group_key->count.
      aggregated_item->min = 9999999.
      LOOP AT GROUP group_key REFERENCE INTO DATA(group_item).
        aggregated_item->sum = aggregated_item->sum + group_item->number.
        aggregated_item->min = nmin( val1 = aggregated_item->min
                                     val2 = group_item->number ).
        aggregated_item->max = nmax( val1 = aggregated_item->max
                                     val2 = group_item->number ).
      ENDLOOP.
      aggregated_item->average = aggregated_item->sum / aggregated_item->count.
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.