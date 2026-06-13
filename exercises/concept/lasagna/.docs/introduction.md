# Introduction

ABAP supports an object-oriented programming model that is based on classes and interfaces of ABAP Objects.

## (Re-)Assignment

There are a few primary ways to assign values to names in ABAP - using variables or constants. On Exercism, variables are always written in [snake-case][wiki-snake-case]. There is no official guide to follow, and various companies and organizations have various style guides. _Feel free to write variables any way you like_. The upside from writing them the way the exercises are prepared is that they'll be highlighted differently in the web interface and most IDEs.

Variables in ABAP can be defined using the [`constant`][constant] or [`data`][data] keywords.

A variable can reference different values over its lifetime when using `data`. For example, `my_first_variable` can be defined and redefined many times using the [assignment operator `=`][assignment]:

```abap
DATA my_first_variable TYPE i. " integer

my_first_variable = 1.
my_first_variable = 4711 * 3.
my_first_variable = some_complex_calculation( ).
```

In contrast to `data`, variables that are defined with `constant` can only be assigned once. This is used to define constants in ABAP.

```abap
CONSTANT my_first_constant TYPE i VALUE 10.

" Can not be re-assigned
my_first_constant = 20.
// => SyntaxError: Assignment to constant variable.
```

## Class and Method Declarations

In ABAP, units of functionality are encapsulated in _methods_, usually grouping methods together in the same [class][classes] if they belong together. These methods can take parameters (arguments), and can _return_ a value using the `returning` keyword in the method definition. Methods are invoked using `( )` syntax.

```abap
CLASS my_class DEFINITION.

  PUBLIC SECTION.

    METHODS add
      IMPORTING
        num1          TYPE i
        num2          TYPE i
      RETURNING
        VALUE(result) TYPE i.

ENDCLASS.

CLASS my_class IMPLEMENTATION.

  METHOD add.
    result = num1 + num2.
  ENDMETHOD.

ENDCLASS.

add( num1 = 1 num2 = 3 ).
// => 4
```

[constant]: https://help.sap.com/doc/abapdocu_latest_index_htm/latest/en-US/index.htm?file=abapconstants.htm
[data]: https://help.sap.com/doc/abapdocu_latest_index_htm/latest/en-US/index.htm?file=abapdata.htm
[assignment]: https://help.sap.com/doc/abapdocu_latest_index_htm/latest/en-US/index.htm?file=abenequals_operator.htm
[classes]: https://help.sap.com/doc/abapdocu_latest_index_htm/latest/en-US/index.htm?file=abapclass.htm
[methods]: https://help.sap.com/doc/abapdocu_latest_index_htm/latest/en-US/index.htm?file=abapmethods_functional.htm