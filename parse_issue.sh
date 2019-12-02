#!/bin/sh -l
curl -H "Authorization: token $GITHUB_TOKEN" -X GET https://api.github.com/repos/$INPUT_ORG_NAME/$INPUT_REPO_NAME/issues --header "Content-Type:application/vnd.github.symmetra-preview+json" | jq '.[0] |  .body' > temp_issues
env
sed 's/\"//g' temp_issues > latest_issue
rm -rf temp_issues
mv latest_issue issues
git config --global user.email "$INPUT_GLOBAL_EMAIL"
git config --global user.name "$GITHUB_ACTOR"
git add .
git commit -m "Add latest_issue"
git push https://$INPUT_ORG_NAME:$GITHUB_TOKEN@github.com/$INPUT_ORG_NAME/$INPUT_REPO_NAME.git HEAD:master
