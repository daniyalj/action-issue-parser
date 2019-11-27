#!/bin/sh -l
curl -H "Authorization: token $GITHUB_TOKEN" -X GET https://api.github.com/repos/$INPUT_ORG_NAME/$INPUT_REPO_NAME/issues --header "Content-Type:application/vnd.github.symmetra-preview+json" | jq '.[0] |  .body' > issues
env
sed 's/\"//g' issues > latest_issue
cat latest_issue
ls
git clone https://github.com/$INPUT_ORG_NAME/$INPUT_REPO_NAME
ls
cat latest_issue
mv latest_issue $INPUT_REPO_NAME/issues
git config --global user.email "$INPUT_GLOBAL_EMAIL"
git config --global user.name "$GITHUB_ACTOR"
cd $INPUT_REPO_NAME
git add .
git commit -m "Add latest_issue"
git push https://$INPUT_ORG_NAME:$GITHUB_TOKEN@github.com/$INPUT_ORG_NAME/$INPUT_REPO_NAME.git
cd $GITHUB_WORKSPACE
