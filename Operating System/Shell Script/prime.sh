read -p "Enter the Number : " n

i=3
while [ $i -le $n ]
do 
    j=2
    flag=1
    while [ $j -le `expr $i / 2` ]
    do 
        if [ `expr $i % $j` -eq 0 ]
        then
            flag=0
            break
        fi
        j=`expr $j + 1`
    done

    if [ $flag -eq 1 ]
    then
        echo "$i"
    fi

    i=`expr $i + 1`
done