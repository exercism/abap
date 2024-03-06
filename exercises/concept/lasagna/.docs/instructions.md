# Instructions

Lucian's girlfriend is on her way home, and he hasn't cooked their anniversary dinner!

In this exercise, you're going to write some code to help Lucian cook an exquisite lasagna from his favorite cookbook.

You have four tasks related to the time spent cooking the lasagna.

## 1. Define the expected oven time in minutes

Define the `expected_minutes_in_oven` constant that represents how many minutes the lasagna should be in the oven. According to the cooking book, the expected oven time in minutes is `40`.

## 2. Calculate the remaining oven time in minutes

Implement the `remaining_minutes_in_oven` method that takes the actual minutes the lasagna has been in the oven as a _parameter_ and _returns_ how many minutes the lasagna still has to remain in the oven, based on the **expected oven time in minutes** from the previous task.

```abap
remaining_minutes_in_oven( 30 ).
// => 10
```

## 3. Calculate the preparation time in minutes

Implement the `preparation_time_in_minutes` method that takes the number of layers you added to the lasagna as a _parameter_ and _returns_ how many minutes you spent preparing the lasagna, assuming each layer takes you 2 minutes to prepare.

```abap
preparation_time_in_minutes( 2 ).
// => 4
```

## 4. Calculate the total working time in minutes

Implement the `total_time_in_minutes` method that takes _two parameters_: the `numbernumber_of_layers` parameter is the number of layers you added to the lasagna, and the `actual_minutes_in_oven` parameter is the number of minutes the lasagna has been in the oven. The method should _return_ how many minutes in total you've worked on cooking the lasagna, which is the sum of the preparation time in minutes, and the time in minutes the lasagna has spent in the oven at the moment.

```abap
total_time_in_minutes( 
  numbernumber_of_layers = 3
  actual_minutes_in_oven = 20 ).
// => 26
```