#!/bin/bash
GITHUB_API=https://api.github.com
# if github enterprise https://your.github.domain/api/v3
YOUR_REPO_HERE='<User>/<Repo>'
YOUR_DESC_HERE='Describe the status source'
YOUR_CONTEXT_HERE='Context of status'
echo "== sending pending status =="
echo "curl   -X POST   -H \"Accept: application/vnd.github.v3+json\"  -H \"Authorization: token $bamboo_GITHUB_STATUS_API_secret\" $GITHUB_API $GITHUB_API/repos/$YOUR_REPO_HERE/statuses/${bamboo.planRepository.revision}   -d '{\"state\":\"pending\", \"description\":\"$YOUR_DESC_HERE\"target_url\":\"$bamboo_resultsUrl\", \"context\":\"$YOUR_CONTEXT_HERE\"}'"
curl   -X POST   -H "Accept: application/vnd.github.v3+json"  -H "Authorization: token $bamboo_GITHUB_STATUS_API_secret" $GITHUB_API $GITHUB_API/repos/$YOUR_REPO_HERE/statuses/${bamboo.planRepository.revision}   -d '{"state":"pending", "description":"$YOUR_DESC_HERE", context":"$YOUR_CONTEXT_HERE"}'
# "target_url":"$bamboo_resultsUrl", 