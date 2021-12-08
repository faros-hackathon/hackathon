API_KEY="xSE8vH9oHZ69o9foYXJIPCmUTqWOjUiX"
GRAPH="default"
START_TIME=$(date +"%Y-%m-%dT%H:%M:%S+0000")
echo "Deployment started at $START_TIME"
sleep 10
END_TIME=$(date +"%Y-%m-%dT%H:%M:%S+0000")
echo "Deployment ended at $END_TIME"

curl --request POST \
     --url https://prod.api.faros.ai/graphs/$GRAPH/events \
     --header "Authorization: $API_KEY" \
     --header 'Accept: application/json' \
     --header 'Content-Type: application/json' \
     --data-raw '{
      "type": "CD",
      "version": "0.0.1",
      "data": {
        "deploy": {
          "id": "'"$CIRCLE_SHA1"'",
          "environment": "'"$ENVIRONMENT"'",
          "application": "'"$CIRCLE_PROJECT_REPONAME"'",
          "source": "Github",
          "status": "Success",
          "startTime": "'"$START_TIME"'",
          "endTime": "'"$END_TIME"'"
        },
        "artifact": {
          "id": "'"$CIRCLE_BUILD_NUM"'",
          "repository": "'"$CIRCLE_PROJECT_REPONAME"'",
          "organization": "acs",
          "source": "Docker"
        }
      }
    }'
