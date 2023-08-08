#!/bin/bash
a=$(cat extracted_gavs_for_old.txt)
b=$(cat extracted_gavs_for_new.txt)
rm diff.txt
touch diff.txt
for x in $b
do
    is_present=false
    for y in $a
    do
        if [ "$y" = "$x" ]
        then
            is_present=true
        fi
    done
    if [ "$is_present" = false ]
    then
	    match='^.*\:.*\:[0-9].*\..*'
	    if [[ "$x" =~ $match ]]
	    then
		    echo "$x" >> diff.txt
	    fi
    fi                
done

old_extracted=$(cat extracted_gavs_for_old.txt)
rm results.txt
touch results.txt
diff=$(cat diff.txt)
for x in $diff
do
	
	G=$(echo $x| cut -d':' -f 1)
	A=$(echo $x| cut -d':' -f 2)
	V=$(echo $x| cut -d':' -f 3)

	for y in $old_extracted
	do
		Gy=$(echo $y| cut -d':' -f 1)
        	Ay=$(echo $y| cut -d':' -f 2)
		Vy=$(echo $y| cut -d':' -f 3)
		if [ "$Gy" = "$G" ] && [ "$Ay" = "$A" ]
		then
			temp="$y >>>>>> $V"
			echo "$temp" >> results.txt
			break
		fi
	done
done


