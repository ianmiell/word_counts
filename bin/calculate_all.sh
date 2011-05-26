#!/bin/bash

for file in `ls ../files/*_files/*_complete`
	do
	file_local=`echo $file | sed 's/^.*\/\(.*\)_complete/\1/g'`
	echo "$file"
	echo "$file_local"
	./calculate.sh $file > ../results/${file_local}_results.txt &
done
echo "Waiting..."
wait
echo "Complete"

