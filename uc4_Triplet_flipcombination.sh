#!/bin/bash -x

read -p "Enter number of times to flip a combination:" no_of_flips
declare -A triplet_frequency=( 

                                [HHH]=0
                                [HHT]=0
                                [HTH]=0
                                [HTT]=0
										  [THH]=0
                                [THT]=0
                                [TTH]=0
                                [TTT]=0


                              )

for(( flip = 1; flip <= no_of_flips; flip++ ))
do
    echo -n "Flip-$flip is "
    ((coin_1 = RANDOM%2))
    ((coin_2 = RANDOM%2))
	 ((coin_3 = RANDOM%2))
      case $coin_1$coin_2$coin_3 in 
        000)
            echo "Heads Heads Heads"
            (( triplet_frequency[HHH]++ )) 
            ;;
        001)
            echo "Heads Heads Tails"
            (( triplet_frequency[HHT]++ ))
            ;;
        010)
            echo "Tails Heads Tails"
            (( triplet_frequency[THT]++ ))
            ;;
        011)
            echo "Heads Tails Tails"
            (( triplet_frequency[HTT]++ ))
            ;;
			100)
            echo "Tails Heads Heads"
            (( triplet_frequency[THH]++ )) 
            ;;
        101)
            echo "Tails Heads Tails"
            (( triplet_frequency[THT]++ ))
            ;;
        110)
            echo "Tails Tails Heads"
            (( triplet_frequency[TTH]++ ))
            ;;
        111)
           echo "Tails Tails Tails"
            (( triplet_frequency[TTT]++ ))
            ;;
         *)
            ;;

esac
done

for combination in ${!triplet_frequency[@]}
do
    percentage=$(( ${triplet_frequency[$combination]}  * 100 / no_of_flips ))
    triplet_frequency[$combination]=$percentage
    echo "percentage of $combination is ${triplet_frequency[$combination]}%"   
done
