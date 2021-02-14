# Bamboo-Update-GithubStatuses
Simple scripts to add in Bamboo to update Github repo statuses based on build results


A collection of scripts for those of us who aren't fully entrenched in Atlassian's ecosystem.

Each script should be a seperate build task.  Place the pending script before any work is done, then place the results script as a final step.

Note you will need to generate a personal access token with access to repo:status and add this token in Bamboo as bamboo_GITHUB_STATUS_API_secret for GitHub to accept your requests.

Beyond that, you should be able to just replace the "YOUR_X_HERE" variables within the scripts for your particular project plan and be good to go!

Some limitations:
  target_url should work, but for whatever reason is returning errors from the GitHub API. YMMV.
  Tested using Bamboo 7.2.2
  You may need to manually repalce the "YOUR_X_HERE" variables instead of referencing them, YMMV.
