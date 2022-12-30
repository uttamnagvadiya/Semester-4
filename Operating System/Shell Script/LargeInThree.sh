read -p "Enter the A : " a
read -p "Enter the B : " b
read -p "Enter the C : " c


# if [ $a -gt $b ]
# then
#     if [ $a -gt $c ]
#     then
#         echo "Number A is Large."
#     else
#         echo "Number C is Large."
#     fi
# else
#     if [ $b -gt $c ] 
#     then
#         echo "Number B is Large."
#     else
#         echo "Number C is Large."
#     fi
# fi

#===============================================

# if [ $a -gt $b ] && [ $a -gt $c ]
# then
#     echo "Number A is Large."
# elif [ $b -gt $a ] && [ $b -gt $c ]
# then
#     echo "Number B is Large."
# else
#     echo "Number C is Large."
# fi

#===============================================

if [ $a -gt $b -a $a -gt $c ]
then
    echo "Number A is Large."
elif [ $b -gt $a -a $b -gt $c ]
then
    echo "Number B is Large."
else
    echo "Number C is Large."
fi