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
          "id": "1237",
          "environment": "'"$ENVIRONMENT"'",
          "application": "'"$APPLICATION_NAME"'",
          "source": "Github",
          "status": "Success",
          "startTime": "'"$START_TIME"'",
          "endTime": "'"$END_TIME"'"
        },
        "artifact": {
          "id": "4",
          "repository": "pay",
          "organization": "acs",
          "source": "Docker"
        }
      }
    }'
