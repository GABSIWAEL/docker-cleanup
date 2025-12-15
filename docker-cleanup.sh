#!/bin/bash

# -----------------------------
# Safe Docker Cleanup Script
# -----------------------------
# This script:
# 1. Stops exited containers
# 2. Removes stopped containers
# 3. Removes dangling/unused images
# 4. Removes dangling build cache
# 5. Keeps volumes intact
# -----------------------------

echo "Starting Docker cleanup..."

# Stop all exited containers
echo "Stopping exited containers..."
docker ps -a -f status=exited -q | xargs -r docker stop

# Remove stopped containers
echo "Removing stopped containers..."
docker ps -a -f status=exited -q | xargs -r docker rm

# Remove dangling images
echo "Removing dangling images..."
docker images -f dangling=true -q | xargs -r docker rmi

# Remove dangling build cache
echo "Removing build cache..."
docker builder prune -f

# Optional: prune everything except volumes
echo "Pruning everything except volumes..."
docker system prune -f

echo "Docker cleanup complete!"

# Show current disk usage
df -h
echo ""
docker system df
