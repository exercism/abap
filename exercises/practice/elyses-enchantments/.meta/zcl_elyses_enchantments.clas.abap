class zcl_elyses_enchantments definition
  public
  final
  create public .

  public section.

    types ty_stack type standard table of i with empty key.

    methods:

      get_item
        importing stack         type ty_stack
                  position      type i
        returning value(result) type i,

      set_item
        importing stack         type ty_stack
                  position      type i
                  replacement   type i
        returning value(result) type ty_stack,

      insert_item_at_top
        importing stack         type ty_stack
                  new_card      type i
        returning value(result) type ty_stack,

      remove_item
        importing stack         type ty_stack
                  position      type i
        returning value(result) type ty_stack,

      remove_item_from_top
        importing stack         type ty_stack
        returning value(result) type ty_stack,

      insert_item_at_bottom
        importing stack         type ty_stack
                  new_card      type i
        returning value(result) type ty_stack,

      remove_item_from_bottom
        importing stack         type ty_stack
        returning value(result) type ty_stack,

      get_size_of_stack
        importing stack         type ty_stack
        returning value(result) type i.

  protected section.
  private section.
endclass.



class zcl_elyses_enchantments implementation.

  method get_item.
    result = stack[ position ].
  endmethod.


  method set_item.

    " abaplint issue #2452, can't do:
*    result = stack.
*    result[ position ] = replacement.

    " This doesn't work either:
*    result = stack.
*    read table result index position assigning field-symbol(<card>).
*    <card> = replacement.


    " Gotta go the old-old-fashioned way:

    clear result.
    loop at stack into data(card).
      if sy-tabix = position.
        append replacement to result.
      else.
        append card to result.
      endif.
    endloop.

  endmethod.


  method insert_item_at_top.
    result = stack.
    append new_card to result.
  endmethod.


  method get_size_of_stack.
    result = lines( stack ).
  endmethod.


  method insert_item_at_bottom.
    result = stack.
    insert new_card into result index 1.
  endmethod.


  method remove_item.
    result = stack.
    delete result index position.
  endmethod.


  method remove_item_from_bottom.
    result = stack.
    delete result index 1.
  endmethod.


  method remove_item_from_top.
    result = stack.
    delete result index lines( stack ).
  endmethod.


endclass.