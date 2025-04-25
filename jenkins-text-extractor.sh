# echo "This script goes throught the input file line by line and filters the input according to the given regex"
# echo "Enter path to file with text: "
# read a
# echo "Enter regex to match a line, something like ^.*:.*:[0-9].*\..*manually"
# read match
# # match='^.*:.*:[0-9].*\..*manually'
# echo "do you want to filter 1. IN or 2. OUT"
# read filter
# echo "enter regex for gav, something like '^.*:.*:[0-9].*\..*'"
# read gav
# ./jenkins-text-extractor.sh ./input.txt ^.*:.*:[0-9].*\..*rebuilt.* OUT ^.*:.*:[0-9].*\..*
a="$1"
match="$2"
filter="$3"
gav="$4"

rm text-extracted.txt
touch text-extracted.txt


#!/bin/bash
while IFS= read -r line; do
    	if [[ "$line" =~ $match ]]
        then
                echo "$line" >> text-extracted.txt
        fi
done < "$a"

b=$(cat text-extracted.txt)

rm gav-extracted.txt
touch gav-extracted.txt

for x in $b
do
        if [[ "$x" =~ $gav ]]
        then
                echo "$x" >> gav-extracted.txt
        fi
done

pattern="^.*:.*:[0-9].*\..*SNAPSHOT"

flag=false
if [[ "$filter" = "OUT" ]]
then
        rm gav-extracted-out.txt;
        touch gav-extracted-out.txt;
        c=$(cat quarkus-bom-deps-to-build.txt)
        d=$(cat gav-extracted.txt)
        for x in $c
        do
                if [[ "$x" = "Artifacts" ]]
                then
                        flag=true
                fi

                if [[ "$flag" = "true" ]]
                then
                        if [[ "$x" =~ $gav ]] &&  ! [[ "$x" =~ $pattern ]]
                        then
                                found=false;
                                for y in $d
                                do     
                                        if [[ "$y" = "$x" ]]
                                        then
                                                found=true;
                                        fi
                                done
                                if [[ "$found" = "false" ]]
                                then
                                        echo "$x" >> gav-extracted-out.txt
                                fi
                        fi
                fi
        done
        echo "results are in gav-extracted-out.txt"
fi


# for x in $a
# do
# 	if [[ "$x" =~ $match ]]
#         then
#                 echo "hello"
#                 echo "$x" >> manual-deps.txt
#         fi
# done

