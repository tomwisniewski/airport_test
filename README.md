A beginner's coding challenge on object oriented programming and test driven development, set by Evgeny Shadchnev at MakersAcademy in 2013.

Test time: 4 hours

Task
Imagine you're writing software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

Your task is to create a set of classes/modules to make the given test suite pass (see the file 'airport_specs.txt').

You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use stubbing to override random weather. Finally, every plane must have a status indicating whether it's flying or landed. You may expand on the given tests (see the file 'airport_specs.txt').

Please create separate files for every class, module and test suite. Commit it to a git repository on Github.

The submission will be judged on the following criteria:

Tests pass
Test coverage is good
The code is elegant (i.e. every class has a clear responsibility, methods are short etc...)