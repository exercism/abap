# Instructions

Learn the basics about ABAP internal tables.

Your class has an internal table named `initial_data`. It has three columns: `GROUP`, `NUMBER`, and `DESCRIPTION`. 

```abap
TYPES  group TYPE c LENGTH 1.
TYPES: BEGIN OF initial_type,
         group       TYPE group,
         number      TYPE i,
         description TYPE string,
       END OF initial_type,
       initial_data TYPE STANDARD TABLE OF initial_type WITH EMPTY KEY.
```

## Step 1

Your first task is to complete the method `fill_itab` and place 6 records into this table with the following values:

| GROUP | NUMBER | DESCRIPTION |
| --- | ----------- | ----------- |
| A | 10 | Group A-2 |
| B | 5 | Group B |
| A | 6 | Group A-1 |
| C | 22 | Group C-1 |
| A | 13 | Group A-3 |
| C | 500 | Group C-2 |

## Step 2

Next implement the method `add_to_itab` to add a record to the end of the internal table with following value:

| GROUP | NUMBER | DESCRIPTION |
| --- | ----------- | ----------- |
| A | 19 | Group A-4 |

## Step 3

Now please sort the internal in the method `sort_itab` with the `GROUP` column in alphabetical order and the `NUMBER` column in descending order.

## Step 4

In the method `search_itab`, search the sorted table and return the index of the record that has a `NUMBER` column value of 6.
