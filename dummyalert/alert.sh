#!/bin/bash
name="test_alert"
url='http://localhost:9093/api/v1/alerts'
echo "firing up alert "
startsAt=2023-01-20T11:27:31-03:00
curl -XPOST $url -d "[{
        \"status\": \"firing\",
        \"labels\": {
                \"alertname\": \"\",
                \"service\": \"test_service\",
                \"severity\":\"critical\",
                \"instance\": \".example.com\"
        },
        \"annotations\": {
                \"summary\": \"This is a test.\"
        },
        \"generatorURL\": \"http://prometheus.example.com\"
}]"
echo ""
echo "press enter to resolve alert"
read
endsAt=2023-01-20T11:27:31-03:00
echo "sending resolve"
curl -XPOST $url -d "[{
        \"status\": \"resolved\",
        \"labels\": {
                \"alertname\": \"\",
                \"service\": \"test_service\",
                \"severity\":\"warning\",
                \"instance\": \".example.com\"
        },
        \"annotations\": {
                \"summary\": \"This is a test.\"
        },
        \"generatorURL\": \"http://prometheus.example.com\"
}]"
echo ""
