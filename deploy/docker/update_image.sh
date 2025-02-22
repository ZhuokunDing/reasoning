#!/bin/bash

# Exit on any error
set -e

# Variables
REGISTRY="at-docker:5000"
IMAGE_NAME="zhuokund/reasoning"  # Change this to your image name
TAG="latest"           # Change this to your desired tag

# Build the Docker image
echo "Building Docker image..."
docker build -t ${IMAGE_NAME}:${TAG} .

# Tag the image for the registry
echo "Tagging image for registry..."
docker tag ${IMAGE_NAME}:${TAG} ${REGISTRY}/${IMAGE_NAME}:${TAG}

# Push the image to the registry
echo "Pushing image to registry..."
docker push ${REGISTRY}/${IMAGE_NAME}:${TAG}

echo "Successfully built and pushed ${REGISTRY}/${IMAGE_NAME}:${TAG}"