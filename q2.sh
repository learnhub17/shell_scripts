n=1
while [ $n -lt 100 ]
do
out=`expr $n % 2 `
if [ $out -ne 0 ]
then
echo " $n is odd"
fi
n=$(( $n + 1 ))
done
