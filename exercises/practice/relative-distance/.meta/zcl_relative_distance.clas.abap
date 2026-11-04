CLASS zcl_relative_distance DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES:
      BEGIN OF ty_family,
        parent   TYPE string,
        children TYPE string_table,
      END OF ty_family,
      ty_family_tree TYPE STANDARD TABLE OF ty_family WITH KEY parent.

    METHODS degree_of_separation
      IMPORTING
        family_tree   TYPE ty_family_tree
        person_a      TYPE string
        person_b      TYPE string
      RETURNING
        VALUE(result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
    TYPES:
      BEGIN OF ty_connection,
        person   TYPE string,
        relative TYPE string,
      END OF ty_connection,
      ty_graph TYPE STANDARD TABLE OF ty_connection WITH EMPTY KEY,
      ty_names TYPE STANDARD TABLE OF string WITH EMPTY KEY,
      BEGIN OF ty_queue_item,
        person TYPE string,
        degree TYPE i,
      END OF ty_queue_item,
      ty_queue TYPE STANDARD TABLE OF ty_queue_item WITH EMPTY KEY.

    METHODS build_graph
      IMPORTING
        family_tree   TYPE ty_family_tree
      RETURNING
        VALUE(result) TYPE ty_graph.

    METHODS add_connection
      IMPORTING
        source      TYPE string
        target      TYPE string
      CHANGING
        graph       TYPE ty_graph.

    METHODS has_person
      IMPORTING
        graph         TYPE ty_graph
        candidate    TYPE string
      RETURNING
        VALUE(result) TYPE abap_bool.

    METHODS relatives_of
      IMPORTING
        graph         TYPE ty_graph
        source        TYPE string
      RETURNING
        VALUE(result) TYPE ty_names.

ENDCLASS.


CLASS zcl_relative_distance IMPLEMENTATION.
  METHOD degree_of_separation.
    result = -1.
    DATA(graph) = build_graph( family_tree ).

    IF has_person( graph = graph candidate = person_a ) = abap_false.
      RETURN.
    ENDIF.

    IF has_person( graph = graph candidate = person_b ) = abap_false.
      RETURN.
    ENDIF.

    DATA(queue) = VALUE ty_queue( ( person = person_a degree = 0 ) ).
    DATA(visited) = VALUE ty_names( ( person_a ) ).

    WHILE lines( queue ) > 0.
      DATA(current) = queue[ 1 ].
      DELETE queue INDEX 1.

      IF current-person = person_b.
        result = current-degree.
        RETURN.
      ENDIF.

      LOOP AT relatives_of( graph = graph source = current-person ) ASSIGNING FIELD-SYMBOL(<relative>).
        IF NOT line_exists( visited[ table_line = <relative> ] ).
          APPEND <relative> TO visited.
          APPEND VALUE #( person = <relative> degree = current-degree + 1 ) TO queue.
        ENDIF.
      ENDLOOP.
    ENDWHILE.
  ENDMETHOD.

  METHOD build_graph.
    LOOP AT family_tree ASSIGNING FIELD-SYMBOL(<family>).
      LOOP AT <family>-children ASSIGNING FIELD-SYMBOL(<child>).
        add_connection(
          EXPORTING
            source      = <family>-parent
            target      = <child>
          CHANGING
            graph       = result ).
        add_connection(
          EXPORTING
            source      = <child>
            target      = <family>-parent
          CHANGING
            graph       = result ).

        LOOP AT <family>-children ASSIGNING FIELD-SYMBOL(<sibling>).
          IF <child> <> <sibling>.
            add_connection(
              EXPORTING
                source      = <child>
                target      = <sibling>
              CHANGING
                graph       = result ).
          ENDIF.
        ENDLOOP.
      ENDLOOP.
    ENDLOOP.
  ENDMETHOD.

  METHOD add_connection.
    IF NOT line_exists( graph[ person = source relative = target ] ).
      APPEND VALUE #( person = source relative = target ) TO graph.
    ENDIF.
  ENDMETHOD.

  METHOD has_person.
    result = line_exists( graph[ person = candidate ] ).
  ENDMETHOD.

  METHOD relatives_of.
    LOOP AT graph ASSIGNING FIELD-SYMBOL(<connection>) WHERE person = source.
      APPEND <connection>-relative TO result.
    ENDLOOP.
  ENDMETHOD.


ENDCLASS.
