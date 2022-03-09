# Tests

You can implement an exercise in your own SAP system. Follow these steps:

1. Create a SAP package for all Exercism exercises in your system (recommended name: `$EXERCISM`)
2. Create a SAP package for each exercise as a subpackage (recommended name: `$EXERCISM_<name-of-exercise>`, example: `$EXERCISM_HELLO-WORLD`)
3. Create an ABAP class corresponding to the exercise (example: `ZCL_HELLO_WORLD`)
4. Copy the template code from Exercism to the class
5. Maintain the test classes and copy the code from Exercism to the test class

Now you can complete the implementation of the class and run the unit test to see if your solution works properly.

Note: This package setup will allow you to backup all your work using [abapGit](https://abapgit.org) by creating a repo for package `$EXERCISM`.
