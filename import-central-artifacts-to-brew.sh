#!/bin/bash


echo "Enter path to file with text: "
read a
echo "Enter path to folder containing utility-scipts like /home/vardhmanjain/projects/"
read b

while IFS= read -r line; do
    	${b}/utility-scripts/mead/mead-download-and-import -v -t quarkus-3.8-maven-imports ${line} || true
        sleep 5
done < "$a"