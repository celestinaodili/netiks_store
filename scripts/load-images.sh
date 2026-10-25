
#!/usr/bin/env bash
set -euo pipefail

CLUSTER_NAME="netiks"

# Load the seven Netiks Store application images.
for svc in web gateway identity-service vendor-service catalog-service media-service admin-service; do
  echo "Loading netiks/$svc:v1 into Kind..."
  kind load docker-image "netiks/$svc:v1" --name "$CLUSTER_NAME"
done

# Pull PostgreSQL.
echo "Pulling postgres:16-alpine..."
docker pull postgres:16-alpine

# Verify that the PostgreSQL image exists locally.
docker image inspect postgres:16-alpine

# Export PostgreSQL to an image archive.
echo "Saving PostgreSQL image to an archive..."
docker save --platform linux/amd64 \
  --output /tmp/postgres-16-alpine.tar \
  postgres:16-alpine

# Load the archive into Kind.
echo "Loading PostgreSQL archive into Kind..."
kind load image-archive /tmp/postgres-16-alpine.tar \
  --name "$CLUSTER_NAME"

# Verify the loaded images.
echo "Verifying application and PostgreSQL images..."
docker exec "${CLUSTER_NAME}-control-plane" \
  crictl images | grep -E 'netiks|postgres'

echo "All application images and PostgreSQL have been loaded."
