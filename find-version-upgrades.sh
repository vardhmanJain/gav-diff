echo "Enter path to file containing artifacts list from previous release"
read old_artifacts_file
echo "Enter path to file containing artifacts from current release"
read new_artifacts_file

rm -f version-upgrades-list.txt  # Added the -f flag to avoid error if the file doesn't exist
touch version-upgrades-list.txt

old_artifacts_list=$(cat "$old_artifacts_file")  # Use "$variable" to correctly reference the file
new_artifacts_list=$(cat "$new_artifacts_file")

for old_artifact in $old_artifacts_list
do
    split_array1=(${old_artifact//:/ })
      
    old_artifact_group=$(echo ${split_array1[0]})  # Fixed the array reference
    old_artifact_artifactid=$(echo ${split_array1[1]})
    old_artifact_version=$(echo ${split_array1[2]})

    for new_artifact in $new_artifacts_list
    do
        split_array2=(${new_artifact//:/ })    

        new_artifact_group=$(echo ${split_array2[0]})  # Fixed the array reference
        new_artifact_artifactid=$(echo ${split_array2[1]})
        new_artifact_version=$(echo ${split_array2[2]})

        if [ "$old_artifact_group" == "$new_artifact_group" ] && [ "$old_artifact_artifactid" == "$new_artifact_artifactid" ]; then
            if [ "$old_artifact_version" != "$new_artifact_version" ]; then  # Added a space before the closing bracket
                echo "$old_artifact --> $new_artifact_version" >> version-upgrades-list.txt
                break
            fi
        fi
    done
done

echo "Output saved in version-upgrades-list.txt"





# echo "Enter artifacts list from previous release"
# read old_artifacts_file
# echo "Enter path to file containing artifacts from current release"
# read new_artifacts_file

# rm version-upgrades-list.txt
# touch version-upgrades-list.txt

# old_artifacts_list=$(cat old_artifacts_file)
# new_artifacts_list=$(cat new_artifacts_file)

# for old_artifact in $old_artifacts_list
# do
#     split_array1=(${old_artifact//:/ })
      
#     old_artifact_group=$(echo ${split_array[0]})
#     old_artifact_artifactid=$(echo ${split_array[1]})
#     old_artifact_version=$(echo ${split_array[2]})
#     for new_artifact in $new_artifacts_list
#     do
#         split_array2=(${new_artifact//:/ })    

#         new_artifact_group=$(echo ${split_array[0]})
#         new_artifact_artifactid=$(echo ${split_array[1]})
#         new_artifact_version=$(echo ${split_array[2]})

#         if [ "$old_artifact_group" == "$new_artifact_group" ] && [ "$old_artifact_artifactid" == "$new_artifact_artifactid" ]; then
#             if [ "$old_artifact_version" != "$new_artifact_version"]; then
#                 echo "$old_artifact --> $new_artifact_version" >> version-upgrades-list.txt
#                 break
#             fi
#         fi

#     done
# done

# echo "Output saved in version-upgrades-list.txt"