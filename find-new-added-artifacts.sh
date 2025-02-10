#!/bin/bash

echo "Enter path to file containing artifacts list from new release"
read new_artifacts_file
echo "Enter path to file containing artifacts list from old release"
read old_artifacts_file

rm -f new-added-artifacts-list.txt  # Remove the old output file if it exists
touch new-added-artifacts-list.txt  # Create a new file to store results

# Loop through new artifacts
while IFS= read -r new_artifact; do
    # Check if the new artifact is not in the old artifact list
    if ! grep -qFx "$new_artifact" "$old_artifacts_file"; then
        echo "$new_artifact" >> new-added-artifacts-list.txt
    fi
done < "$new_artifacts_file"

echo "Output saved in new-added-artifacts-list.txt"


# echo "Enter path to file containing artifacts list from new release"
# read new_artifacts_file
# echo "Enter path to file containing artifacts from old release"
# read old_artifacts_file

# rm -f new-added-artifacts-list.txt  # Added the -f flag to avoid error if the file doesn't exist
# touch new-added-artifacts-list.txt

# old_artifacts_list=$(cat "$old_artifacts_file")  # Use "$variable" to correctly reference the file
# new_artifacts_list=$(cat "$new_artifacts_file")

# for new_artifact in $new_artifacts_list
# do
#     for old_artifact in $old_artifacts_list
#     do
#         if [ "$old_artifact" == "$new_artifact" ]; then
#             break
#         fi
#     done
#     echo "$new_artifact" >> new-added-artifacts-list.txt
# done

# echo "Output saved in new-added-artifacts-list.txt"





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