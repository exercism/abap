# Tests

## On Exercism

Each exercise is provided as a single ABAP class (with one or more methods). Typically, method definitions with input and output parameters are given. Your task is to complete the method implementation according to the specifications of the exercise.

Once you have code you want to test, select "Run Tests". This will trigger the execution of a corresponding ABAP test class and the results will be displayed after a few seconds. If there are errors, go back to your code and adjust it accordingly. If all tests pass, congratulations! You completed the exercise and can submit your solution.

### Troubleshooting

Behind the scenes, your ABAP code is compiled and executed using the so-called [abaplint transpiler](https://github.com/abaplint/transpiler). This is still a relatively new solution. If you have any problems you can't resolve, please create an issue on [GitHub](https://github.com/abaplint/transpiler/issues).

### Debugging and Logging

Currently, running ABAP exercises on the Exercism website does not provide any debugging or logging capabilities. That can make it hard to determine why your tests are failing. However, there's a clever way to log data in your code.

Here's an example. The first image shows the exercise code with some failing tests. Each failed test shows the expected and actual values:

![exercise without logging](https://github.com/exercism/abap/blob/main/docs/logging_01.png?raw=true)

To make debugging easier, add a local `log` variable and concatenate intermediate data to it. At the end of your method, simply return the `log` value instead of the actual result. When you run the tests, you will now see the complete logging information in the test results: 

![exercise with logging](https://github.com/exercism/abap/blob/main/docs/logging_02.png?raw=true)

After correcting your code, remove the final statement returning the proper result. 

## On Your Own System

### Complete track

The easiest way to get started using your own system for practicing is to clone [this repository](https://github.com/exercism/abap) using [abapGit](https://github.com/abapGit/abapGit). This will create the stubs and test classes for all exercises that are currently available.

### Individual exercises

Start your ABAP Development Tools (or transactions `SE24` or `SE80` if you have an older system) and create a new ABAP class named like the class in the exercise. Implement the class stub and test class as well by copying and pasting the code from the Exercism website. 

### Implementing solutions

Now you can edit the class for an exercise and implement a solution. Then run the ABAP unit tests to check if it passes all tests. Once completed and tested successfully, cut and paste your code into the editor for the exercise on the Exercism website. Run the tests there as well. 

### Testing and completing the exercise

When coding and testing in your own system, the standard SAP ABAP compiler and execution is used. If your tests fail, it's likely related to your own code. Take another look. 

If your code passes the unit tests successfully, cut and paste your class implementation into the exercise on the Exercism website and select "Run Tests". The tests should pass there as well, of course. If it does not, see the troubleshooting section above. 
