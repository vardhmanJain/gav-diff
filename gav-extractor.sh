echo "Enter path to old data: "
read a
echo "Enter path to new data: "
read b

match='^.*:.*:[0-9].*\..*'

rm extracted_gavs_for_old.txt
rm extracted_gavs_for_new.txt
touch extracted_gavs_for_old.txt
touch extracted_gavs_for_new.txt

for x in $a
do
	if [[ "$x" =~ $match ]]
        then
                echo "$x" >> extracted_gavs_for_old.txt
        fi
done

for x in $b
do
	if [[ "$x" =~ $match ]]
        then
                echo "$x" >> extracted_gavs_for_new.txt
        fi
done

./simple-script.sh
