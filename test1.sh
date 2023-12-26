#!/bin/bash

# Check if the username is provided as a command line argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <github_username>"
    exit 1
fi

# GitHub username
username=$1

# GitHub API endpoint for user repositories
api_url="https://api.github.com/users/$username/repos"

# Make a GET request to the GitHub API
response=$(curl -s "$api_url")

# Check if the request was successful (HTTP status code 200)
if [ $? -eq 0 ]; then
    # Parse the response using a tool like jq
    # Make sure jq is installed: sudo apt-get install jq
    repo_count=$(echo "$response" | jq length)

    echo "User $username has $repo_count repositories on GitHub."
else
    echo "Failed to retrieve data from GitHub API. Please check your internet connection or try again later."
fi

