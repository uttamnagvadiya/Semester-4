# read -p "Enter the number : " n

# remainder=0
# rev=""
# temp=$n
  
# while [ $n -gt 0 ]
# do
#     remainder=$(( $n % 10 )) 
     
#     n=$(( $n / 10 ))
     
#     rev=$( echo ${rev}${remainder} )
# done
  
# if [ $temp -eq $rev ];
# then
#     echo "Number is palindrome"
# else
#     echo "Number is NOT palindrome"
# fi


# ==================================================================

read -p "Enter the starting number : " start
read -p "Enter the ending number : " end




i=$start

while [ $i -le $end ] 
do
    j=$i
    rev=""
    remainder=0
    while [ $j -gt 0 ]
    do
        remainder=$(($j % 10 ))

        j=$(( $j / 10))
        rev=$( echo ${rev}${remainder})
    done
    if [ $i -eq $rev ]
    then
        echo "$i"
    fi

    i=`expr $i + 1`
done
