# Container image that runs your code
FROM alpine:3.10

RUN apk update \
 && apk add jq \
 && apk add curl \
 && apk add git \
 && rm -rf /var/cache/apk/*

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY parse_issue.sh /parse_issue.sh

RUN chmod +x /parse_issue.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/parse_issue.sh"]
