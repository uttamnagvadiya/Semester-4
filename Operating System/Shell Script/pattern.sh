read -p "Enter the starting number : " n

for(( i=1; i<=n; i++ ))
do
    for(( j=1; j<=i; j++ ))
    do
        echo -n " * "
    done
    echo
done

echo "================================="

for(( i=1; i<=n; i++ ))
do
    for(( j=1; j<=i; j++ ))
    do
        echo -n $i
    done
    echo
done

echo "================================="

for(( i=1; i<=n; i++ ))
do
    for(( j=1; j<=n-i; j++ ))
    do
        echo -n " "
    done
    for(( j=1; j<=i; j++ ))
    do
        echo -n "$j "
    done
    echo
done

echo "================================="
num=1
for(( i=1; i<=n; i++ ))
do
    for(( j=1; j<=i; j++ ))
    do
        echo -n "$num "
        num=`expr $num + 1`
    done
    echo
done

echo "================================="
x=`expr $n - 1`
for(( i=1; i<=n; i++ ))
do
    echo -n "$i "
    for(( j=1; j<i; j++ ))
    do  
        x=`expr $x + $ji`
        echo -n "$x "
    done
    echo
done