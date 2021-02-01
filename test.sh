#!/bin/bash

norm=$(~/.norminette/norminette.rb ../ | grep Error)
if [ -z "$norm" ];
then
	echo -n "Norm :"
	echo -ne "\033[0;32m \xE2\x9C\x94	\033[0m"
else
	echo -n "Norm :"
	echo -ne "\033[0;31m x	\033[0m"
	echo $norm
	exit
fi

make -C ../philo_one
make -C ../philo_two
make -C ../philo_three

PHILOSOPHES=( philo_one philo_two philo_three )

for philosophe in ${PHILOSOPHES[*]}
do 
	# PHILO_ONE
	echo
	echo $philosophe
	philo=$philosophe

	echo ARGS 5 800 200 200 X
	# 5 800 200 200

	av_1=5
	av_2=800
	av_3=200
	av_4=200
	av_5=1

	while [ $av_5 -le 10 ]
	do
		./../$philo/$philo $av_1 $av_2 $av_3 $av_4 $av_5 > test.log 
		# BACK_PID=$!
		# wait $BACK_PID
		nb=$(( av_1*av_5 ))
		test=$(cat test.log | grep eating | wc)
		ok=$(echo $test | grep $nb)
		if [ -z "$ok" ];
		then
			echo -n "Test $av_5 :"
			echo -ne "\033[0;31m x	\033[0m"
		else
			echo -n "Test $av_5 :"
			echo -ne "\033[0;32m \xE2\x9C\x94	\033[0m"
		fi
		av_5=$(( $av_5 + 1 ))
	done

	echo
	echo ARGS 4 410 200 200 X
	# 4 410 200 200

	av_1=4
	av_2=410
	av_3=200
	av_4=200
	av_5=1

	while [ $av_5 -le 10 ]
	do
		./../$philo/$philo $av_1 $av_2 $av_3 $av_4 $av_5 > test.log 
		# BACK_PID=$!
		# wait $BACK_PID
		nb=$(( av_1*av_5 ))
		test=$(cat test.log | grep eating | wc)
		ok=$(echo $test | grep $nb)
		if [ -z "$ok" ];
		then
			echo -n "Test $av_5 :"
			echo -ne "\033[0;31m x	\033[0m"
		else
			echo -n "Test $av_5 :"
			echo -ne "\033[0;32m \xE2\x9C\x94	\033[0m"
		fi
		av_5=$(( $av_5 + 1 ))
	done

	echo
	echo ARGS 4 310 200 100 X
	# 4 310 200 100

	av_1=4
	av_2=310
	av_3=200
	av_4=100
	av_5=2

	while [ $av_5 -le 11 ]
	do
		./../$philo/$philo $av_1 $av_2 $av_3 $av_4 $av_5 > test.log 
		# BACK_PID=$!
		# wait $BACK_PID
		nb=$(( av_1*av_5 ))
		test=$(cat test.log | grep died)
		# ok=$(echo $test | grep $nb)
		if [ -z "$test" ];
		then
			echo -n "Test $av_5 :"
			echo -ne "\033[0;31m x	\033[0m"
		else
			echo -n "Test $(( $av_5 - 1 )) :"
			echo -ne "\033[0;32m \xE2\x9C\x94	\033[0m"
		fi
		av_5=$(( $av_5 + 1 ))
	done

	echo
	echo GOING BIG 50 1300 100 100 X

	av_1=50
	av_2=1300
	av_3=100
	av_4=100
	av_5=1

	while [ $av_5 -le 10 ]
	do
		./../$philo/$philo $av_1 $av_2 $av_3 $av_4 $av_5 > test.log 
		# BACK_PID=$!
		# wait $BACK_PID
		nb=$(( av_1*av_5 ))
		test=$(cat test.log | grep eating | wc)
		ok=$(echo $test | grep $nb)
		if [ -z "$ok" ];
		then
			echo -n "Test $av_5 :"
			echo -ne "\033[0;31m x	\033[0m"
		else
			echo -n "Test $av_5 :"
			echo -ne "\033[0;32m \xE2\x9C\x94	\033[0m"
		fi
		av_5=$(( $av_5 + 1 ))
	done


	echo
done

bash one.sh 1 1 10 5 5 
bash one.sh 2 1 10 5 5 
bash one.sh 3 1 10 5 5 

bash one.sh 1 1 10 5 5 1
bash one.sh 2 1 10 5 5 1
bash one.sh 3 1 10 5 5 1

bash one.sh 1 200 200 100 100 | grep died
bash one.sh 2 200 200 100 100 | grep died
bash one.sh 3 200 200 100 100 | grep died

bash one.sh 1 200 1300 100 100 10 | grep eating | wc
bash one.sh 2 200 1300 100 100 10 | grep eating | wc
bash one.sh 3 200 1300 100 100 10 | tee > test.log
cat test.log | grep eating | wc

bash valgrind.sh 1 2 10 5 5
bash valgrind.sh 2 2 10 5 5
bash valgrind.sh 3 2 10 5 5

bash valgrind.sh 1 2 10000 5000 5 1
bash valgrind.sh 2 2 10000 5000 5 1
bash valgrind.sh 3 2 10000 5000 5 1

#  ps aux | grep -ie $philo | awk '{print $2}' | xargs kill -9
