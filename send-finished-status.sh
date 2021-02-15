#!/bin/bash
echo "Status:"
echo "$bamboo_jobFailed"
# if github enterprise https://your.github.domain/api/v3
GITHUB_API=https://api.github.com
YOUR_REPO_HERE='<user>/<repo>'
YOUR_SUCCESS_DESC_HERE='Describe the reason for the success result'
YOUR_FAILURE_DESC_HERE='Describe the reason for the failed result'
YOUR_CONTEXT_HERE='Provide result context'
if [ $bamboo_jobFailed != "false" ]; then
    echo "Pull request build failed"
    curl   -X POST   -H "Accept: application/vnd.github.v3+json"  -H "Authorization: token $bamboo_GITHUB_STATUS_API_secret" $GITHUB_API $GITHUB_API/repos/$YOUR_REPO_HERE/statuses/${bamboo.planRepository.revision}   -d '{"state":"failure", "description":"$YOUR_DESC_HERE", "context":"$YOUR_CONTEXT_HERE"}'
    # "target_url":"$bamboo_resultsUrl", 
    echo "curl   -X POST   -H \"Accept: application/vnd.github.v3+json\"  -H \"Authorization: token $bamboo_GITHUB_STATUS_API_secret\" $GITHUB_API $GITHUB_API/repos/$YOUR_REPO_HERE/statuses/${bamboo.planRepository.revision}   -d '{\"state\":\"failure\", \"description\":\"$YOUR_DESC_HERE\", \"target_url\":\"$bamboo_resultsUrl\", \"context\":\"YOUR_CONTEXT_HERE\"}'"
else
    echo "Pull request build succeeded"
    curl   -X POST   -H "Accept: application/vnd.github.v3+json"  -H "Authorization: token $bamboo_GITHUB_STATUS_API_secret" $GITHUB_API $GITHUB_API/repos/$YOUR_REPO_HERE/statuses/${bamboo.planRepository.revision}   -d '{"state":"success", "description":"$YOUR_SUCCESS_DESC_HERE", "context":"$YOUR_CONTEXT_HERE"}'
    # "target_url":"$bamboo_resultsUrl", 
    echo "curl   -X POST   -H \"Accept: application/vnd.github.v3+json\"  -H \"Authorization: token $bamboo_GITHUB_STATUS_API_secret\" $GITHUB_API $GITHUB_API/repos/$YOUR_REPO_HERE/statuses/${bamboo.planRepository.revision}   -d '{\"state\":\"success\", \"description\":\"$YOUR_SUCCESS_DESC_HERE\", \"target_url\":\"$bamboo_resultsUrl\", \"context\":\"$YOUR_CONTEXT_HERE\"}'"
fi
echo "Finished sending PR results."
