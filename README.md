# alientest_philosopher_2021

this repo is a fork of [alientest_philosophers](https://github.com/lienardale/alientest_philosopher.git) made by [lienardale](https://github.com/lienardale) adapted to the new subject (2021)

Clone this repo at your philosopher's root (at the same level of your philo and philo_bonus directories).

Basic usage : 'bash test.sh'

How to read the output : 
	green tick : test passed
	red cross : test failed

This tester is not enough to validate the project, remember to also test :
- norm
- each program without a 5th argument
- check the coherence of the output
- ask for explanations on the choices that were made and the issues encountered

To run only one test or valgrind with your own args, you can use :
- bash one.sh 
- bash valgrind.sh
with the same args as if you were executing one of your philosophers + the nb of the philo you want to test as the first arg
ex : "bash one.sh 1 2 10 5 5" (launches ./philo 2 10 5 5)

To run the test for all the philo add "all" to the arguments.
To run only test.sh for philo_bonus add "bonus" to the arguments.

To run only valgrind tests : 'bash leak_test.sh'
To run the test for all the philo add "all" to the arguments.
To run only leak_test.sh for philo_bonus add "bonus" to the arguments.
