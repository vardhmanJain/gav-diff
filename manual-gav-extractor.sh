echo "Enter path to file with manual deps: "
read a

match='^.*:.*:[0-9].*\..*manually'

rm manual-deps.txt
touch manual-deps.txt

#!/bin/bash
while IFS= read -r line; do
    	if [[ "$line" =~ $match ]]
        then
                # echo "hello"
                echo "$line" >> manual-deps.txt
        fi
done < "$a"

b=$(cat manual-deps.txt)
gav='^.*:.*:[0-9].*\..*'
rm manual-deps-gav.txt
touch manual-deps-gav.txt

for x in $b
do
        if [[ "$x" =~ $gav ]]
        then
                echo "$x" >> manual-deps-gav.txt
        fi
done
# for x in $a
# do
# 	if [[ "$x" =~ $match ]]
#         then
#                 echo "hello"
#                 echo "$x" >> manual-deps.txt
#         fi
# done

