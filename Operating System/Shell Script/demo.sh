echo "Enter the X : "
read x
echo "Enter the Y : "
read y

sum=`expr $x + $y`
sub=`expr $x - $y`
multi=`expr $x \* $y`
div=`expr $x / $y`

echo "Sum = $sum"
echo "Sub = $sub"
echo "Multi = $multi"
# awk "BEGIN {print $x/$y}"  // return   floating point number 
echo "scale=2; ${div}" 
