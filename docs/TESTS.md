# Tests

## On Exercism

Each exercise is provided as a single ABAP class (with one or more methods). Typically, method definitions with input and output parameters are given. Your task is to complete the method implementation according to the specifications of the exercise.

Once you have code you want to test, select "Run Tests". This will trigger the execution of a corresponding ABAP test class and the results will be displayed after a few seconds. If there are errors, go back to your code and adjust it accordingly. If all tests pass, congratulations! You completed the exercise and can submit your solution.

### Troubleshooting

Behind the scenes, the your ABAP code is compiled and executed using the so-called [abaplint transpiler](https://github.com/abaplint/transpiler). This is still a relatively new solution. If you have any problems you can't resolve, please create an issue on [GitHub](https://github.com/abaplint/transpiler/issues).

## On Your Own System

Start your ABAP Development Tools (or transaction SE24 if you have an older system) and create a new ABAP class named like the class in the exercise. Implement the class and implement the test class as well by copying the test code from the Exercism website. You can then run the unit tests locally. 

### Troubleshooting

When codeing and testing in your own system, the standard SAP ABAP compiler and execution is used. If your tests fail, it's likely related to your own code. Take another look. 

If your code passes the unit tests successfully, cut & paste your class implementation into the exercise on Exercism and select "Run Tests". The tests should pass there as well, of course. If it does not, see the troubleshooting section above. 
