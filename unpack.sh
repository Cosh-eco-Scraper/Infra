#!/bin/bash

# Script to unpack and load two Docker image tar files
# Usage: ./unpack.sh <cosh_scraper_backend.tar> <cosh_scraper_frontend.tar>

# Check if two arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Please provide exactly two tar files as arguments"
    echo "Usage: ./unpack.sh <cosh_scraper_backend.tar> <cosh_scraper_frontend.tar>"
    exit 1
fi

# Check if files exist and are readable
for file in "$1" "$2"; do
    if [ ! -f "$file" ] || [ ! -r "$file" ]; then
        echo "Error: File '$file' does not exist or is not readable"
        exit 1
    fi
done

# Load backend Docker image
echo "Loading backend Docker image from $1..."
docker load < "$1"
docker tag $(docker images -q | head -n1) backend-server:latest

# Restart backend container if running
if [ "$(docker ps -q -f name=server)" ]; then
    echo "Restarting backend container..."
    docker restart server
fi

# Load frontend Docker image  
echo "Loading frontend Docker image from $2..."
docker load < "$2"
docker tag $(docker images -q | head -n1) frontend-server:latest

# Restart frontend container if running
if [ "$(docker ps -q -f name=frontend)" ]; then
    echo "Restarting frontend container..."
    docker restart frontend
fi

echo "Docker images have been successfully loaded and tagged"