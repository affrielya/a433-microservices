#!/bin/bash

# Deklarasi variabel
IMAGE_NAME="karsajobs-ui"
IMAGE_TAG="latest"
GITHUB_USERNAME="affrielya"

# Membuat Docker image baru 
docker build -t docker.pkg.github.com/$GITHUB_USERNAME/karsajobs-ui/$IMAGE_NAME:$IMAGE_TAG .

# Mengubah nama image sesuai format Github Packages
docker tag $IMAGE_NAME:$IMAGE_TAG docker.pkg.github.com/$GITHUB_USERNAME/karsajobs-ui/$IMAGE_NAME:$IMAGE_TAG

# Login ke Github Packages
echo $GHCR_PAT | docker login docker.pkg.github.com -u $GITHUB_USERNAME --password-stdin

# Mengunggah image ke Github Packages
docker push docker.pkg.github.com/$GITHUB_USERNAME/karsajobs-ui/$IMAGE_NAME:$IMAGE_TAG

