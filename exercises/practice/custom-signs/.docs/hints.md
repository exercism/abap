## General

- [String Templates][sap-string-templates] are a [String Expression](https://help.sap.com/doc/abapdocu_latest_index_htm/latest/en-US/index.htm?file=abapcompute_string.htm) type that allows for insertion of one or more [embedded expressions][sap-embed-expr] in strings.

- Optional: The [COND Conditional Operator][sap-cond-operator] is a short-hand way of embedding a condition into an expression. Since we can embed expressions in string templates, we can do away with an `IF...ELSE...ENDIF` construct altogether.

- String Templates also allow insertion of [Control Characters](https://help.sap.com/doc/abapdocu_latest_index_htm/latest/en-US/index.htm?file=abenstring_templates_separators.htm), a shorter form of the [`cl_abap_char_utilities`](https://help.sap.com/doc/abapdocu_latest_index_htm/latest/en-US/index.htm?file=abencl_abap_char_utilities.htm) class constants some ABAPers may be used to.

- Built in string description functiond can help to figure out the [length](https://help.sap.com/doc/abapdocu_latest_index_htm/latest/en-US/index.htm?file=abenlength_functions.htm) of the sign.

- String Template [embedded expressions][sap-embed-expr] can also include [formatting options](https://help.sap.com/doc/abapdocu_latest_index_htm/latest/en-US/index.htm?file=abapcompute_string_format_options.htm). These can be helpful to show only an output with a fixed number of decimals.

[sap-string-templates]: https://help.sap.com/doc/abapdocu_latest_index_htm/latest/en-US/index.htm?file=abenstring_templates.htm
[sap-cond-operator]: https://help.sap.com/doc/abapdocu_latest_index_htm/latest/en-US/index.htm?file=abenconditional_expression_cond.htm
[sap-embed-expr]: https://help.sap.com/doc/abapdocu_latest_index_htm/latest/en-US/index.htm?file=abenstring_templates_expressions.htm