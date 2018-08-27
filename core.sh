#!/usr/bin/env bash

# exit when any command fails
set -e

LEVEL=$1
if [ -z "${LEVEL+x}" ]; then
    LEVEL="Warning";
fi

echo "LEVEL == $LEVEL"

oc whoami --request-timeout=5s

PROJECTS=$(oc get projects --no-headers | cut -d' ' -f1 | xargs)
PROJECTS_ARRAY=($PROJECTS)

for project in "${PROJECTS_ARRAY[@]}" ; do
    echo "Project: $project"

    oc get events --output=json -n "$project" |
        jq '.items | .[] | select(.type=="'$LEVEL'")' |
        jq '.metadata.name + " >> " +  .reason + " @ " + .metadata.creationTimestamp + " || " + .message'
    echo
done
