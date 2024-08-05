#!/bin/bash
rm ./analysis/brew-output.txt
echo "ARTIFACTS DOWNLOADED FROM Brew" >> ./analysis/brew-output.txt
for ARTIFACT_PATH in $(grep -Po '(?<=Downloading from brew: http://download.lab.bos.redhat.com/brewroot/repos/quarkus-3.8-maven-build/latest/maven/)[^ ]+' input.txt); do
    echo "ARTIFACT_PATH: ${ARTIFACT_PATH}"

    ARTIFACT_VERSION=$(basename $(dirname ${ARTIFACT_PATH}))
    ARTIFACT_ID=$(basename $(dirname $(dirname ${ARTIFACT_PATH})))
    ARTIFACT_GROUP=$(dirname $(dirname $(dirname ${ARTIFACT_PATH})) | sed 's~/~.~g')

    echo "ARTIFACT_GROUP: ${ARTIFACT_GROUP}"
    echo "ARTIFACT_ID: ${ARTIFACT_ID}"
    echo "ARTIFACT_VERSION: ${ARTIFACT_VERSION}"
    echo "${ARTIFACT_GROUP}:${ARTIFACT_ID}:${ARTIFACT_VERSION}" >> ./analysis/brew-output.txt

    # /utility-scripts/mead/mead-download-and-import -v -t ${BREW_IMPORT_TAG} ${ARTIFACT_GROUP}:${ARTIFACT_ID}:${ARTIFACT_VERSION} || true
done


rm ./analysis/central-output.txt
echo "ARTIFACTS DOWNLOADED FROM MAVEN CENTRAL" >> ./analysis/central-output.txt
for ARTIFACT_PATH in $(grep -Po '(?<=Downloaded from central: https://repo.maven.apache.org/maven2/)[^ ]+' input.txt); do
    echo "ARTIFACT_PATH: ${ARTIFACT_PATH}"

    ARTIFACT_VERSION=$(basename $(dirname ${ARTIFACT_PATH}))
    ARTIFACT_ID=$(basename $(dirname $(dirname ${ARTIFACT_PATH})))
    ARTIFACT_GROUP=$(dirname $(dirname $(dirname ${ARTIFACT_PATH})) | sed 's~/~.~g')

    echo "ARTIFACT_GROUP: ${ARTIFACT_GROUP}"
    echo "ARTIFACT_ID: ${ARTIFACT_ID}"
    echo "ARTIFACT_VERSION: ${ARTIFACT_VERSION}"
    echo "${ARTIFACT_GROUP}:${ARTIFACT_ID}:${ARTIFACT_VERSION}" >> ./analysis/central-output.txt

    # /utility-scripts/mead/mead-download-and-import -v -t ${BREW_IMPORT_TAG} ${ARTIFACT_GROUP}:${ARTIFACT_ID}:${ARTIFACT_VERSION} || true
done


rm ./analysis/pnc-output.txt
echo "ARTIFACTS DOWNLOADED FROM PNC" >> ./analysis/pnc-output.txt
for ARTIFACT_PATH in $(grep -Po '(?<=Downloaded from pnc: https://indy.psi.redhat.com/api/content/maven/hosted/pnc-builds/)[^ ]+' input.txt); do
    echo "ARTIFACT_PATH: ${ARTIFACT_PATH}"

    ARTIFACT_VERSION=$(basename $(dirname ${ARTIFACT_PATH}))
    ARTIFACT_ID=$(basename $(dirname $(dirname ${ARTIFACT_PATH})))
    ARTIFACT_GROUP=$(dirname $(dirname $(dirname ${ARTIFACT_PATH})) | sed 's~/~.~g')

    echo "ARTIFACT_GROUP: ${ARTIFACT_GROUP}"
    echo "ARTIFACT_ID: ${ARTIFACT_ID}"
    echo "ARTIFACT_VERSION: ${ARTIFACT_VERSION}"
    echo "${ARTIFACT_GROUP}:${ARTIFACT_ID}:${ARTIFACT_VERSION}" >> ./analysis/pnc-output.txt

    # /utility-scripts/mead/mead-download-and-import -v -t ${BREW_IMPORT_TAG} ${ARTIFACT_GROUP}:${ARTIFACT_ID}:${ARTIFACT_VERSION} || true
done

















# for ARTIFACT_PATH in $(grep -Po '(?<=https://indy-gateway.indy.svc.cluster.local/api/folo/track/build-A6JSMVNW2DYAA/maven/hosted/build-./)[^ ]+' ${WORKSPACE}/netty-build.log); do
#     echo "ARTIFACT_PATH: ${ARTIFACT_PATH}"

#     ARTIFACT_VERSION=$(basename $(dirname ${ARTIFACT_PATH}))
#     ARTIFACT_ID=$(basename $(dirname $(dirname ${ARTIFACT_PATH})))
#     ARTIFACT_GROUP=$(dirname $(dirname $(dirname ${ARTIFACT_PATH})) | sed 's~/~.~g')

#     echo "ARTIFACT_GROUP: ${ARTIFACT_GROUP}"
#     echo "ARTIFACT_ID: ${ARTIFACT_ID}"
#     echo "ARTIFACT_VERSION: ${ARTIFACT_VERSION}"

#     /utility-scripts/mead/mead-download-and-import -v -t ${BREW_IMPORT_TAG} ${ARTIFACT_GROUP}:${ARTIFACT_ID}:${ARTIFACT_VERSION} || true
# done

# while IFS= read -r line; do
#     arrIN=(${line//\// })
#     version=${arrIN[-2]}
#     artifact=${arrIN[-3]}
#     echo "The last element is: $last_element"
# done < "$a"

# b=$(cat text-extracted.txt)

# rm gav-extracted.txt
# touch gav-extracted.txt

# for x in $b
# do
#         if [[ "$x" =~ $gav ]]
#         then
#                 echo "bye"
#                 echo "$x" >> gav-extracted.txt
#         fi
# done