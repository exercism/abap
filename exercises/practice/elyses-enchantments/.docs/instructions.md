# Instructions

As a magician-to-be, Elyse needs to practice some basics. She has
a stack of cards that she wants to manipulate.

To make things a bit easier she only uses the cards 1 to 10 so her
stack of cards can be represented by an internal table of numbers. The position
of a certain card corresponds to the table row. That means
row 1 refers to the first card, row 2 to the second card etc.

## 1. Retrieve a card from a stack

To pick a card, return the card at index `position` from
the given stack.

```abap
data(stack) = value #( ( 1 ) ( 2 ) ( 4 ) ( 1 ) ).
data(card) = get_Item( stack = stack
                       position = 3 ).   " card = 4
```

## 2. Exchange a card in the stack

Perform some sleight of hand and exchange the card at index `position`
with the replacement card provided.
Return the adjusted stack.

```abap
data(stack) = value #( ( 1 ) ( 2 ) ( 4 ) ( 1 ) ).
data(new_Stack) = set_Item( stack = stack
                            position = 3 
                            replacement = 6 ).   
" new_Stack = 1, 2, 6, 1
```

## 3. Insert a card at the top of the stack

Make a card appear by inserting a new card at the top of the stack.
Return the adjusted stack.

```abap
data(stack) = value #( ( 5 ) ( 9 ) ( 7 ) ( 1 ) ).
data(new_Stack) = insert_Item_at_Top( stack    = stack
                                      new_Card = 8 ).   
" new_Stack = 5, 9, 7, 1, 8
```

## 4. Remove a card from the stack

Make a card disappear by removing the card at the given `position` from the stack.
Return the adjusted stack.

```abap
data(stack) = value #( ( 3 ) ( 2 ) ( 6 ) ( 4 ) ( 8 ) ).
data(new_Stack) = remove_Item( stack    = stack
                               position = 3 ).   
" new_Stack = 3, 2, 4, 8
```

## 5. Remove the top card from the stack

Make a card disappear by removing the card at the top of the stack.
Return the adjusted stack.

```abap
data(stack) = value #( ( 3 ) ( 2 ) ( 6 ) ( 4 ) ( 8 ) ).
data(new_Stack) = remove_Item_from_Top( stack ).   
" new_Stack = 3, 2, 6, 4
```

## 6. Insert a card at the bottom of the stack

Make a card appear by inserting a new card at the bottom of the stack.
Return the adjusted stack.

```abap
data(stack) = value #( ( 5 ) ( 9 ) ( 7 ) ( 1 ) ).
data(new_Stack) = insert_Item_at_Bottom( stack    = stack
                                         new_Card = 8 ).   
" new_Stack = 8, 5, 9, 7, 1
```

## 7. Remove a card from the bottom of the stack

Make a card disappear by removing the card at the bottom of the stack.
Return the adjusted stack.

```abap
data(stack) = value #( ( 8 ) ( 5 ) ( 9 ) ( 7 ) ( 1 ) ).
data(new_Stack) = remove_Item_from_Top( stack ).   
" new_Stack = 5, 9, 7, 1
```

## 8. Check the size of the stack

Return the size of the stack (number of rows).

```abap
data(stack) = value #( ( 3 ) ( 2 ) ( 6 ) ( 4 ) ( 8 ) ).
data(size_of_Stack) = get_Size_of_Stack( stack ).   
" size_of_Stack = 5
```