echo "Enter the Number : "
read number

if [ `expr $number % 2` -eq 0 ]
then
    echo "Number is Even."
else
    echo "Number is Odd."
fi