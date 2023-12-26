#!/bin/bash

# Check if the GitHub token is set
if [ -z "$GITHUB_TOKEN" ]; then
    echo "GitHub token not set. Please set the GITHUB_TOKEN environment variable."
    exit 1
fi

# GitHub repository information
owner="shankarv12"
repo="test1"

# GitHub API endpoint for pull requests
api_url="https://api.github.com/repos/$owner/$repo/pulls"

# Make a GET request to the GitHub API using a token for authentication
response=$(curl -s -H "Authorization: token $GITHUB_TOKEN" "$api_url")

# Check if the request was successful (HTTP status code 200)
if [ $? -eq 0 ]; then
    # Parse the response using jq and get the length of the array
    pr_count=$(echo "$response" | jq length)

    echo "Number of pull requests in $owner/$repo: $pr_count"
else
    echo "Failed to retrieve data from GitHub API. Please check your GitHub token and repository information."
fi

