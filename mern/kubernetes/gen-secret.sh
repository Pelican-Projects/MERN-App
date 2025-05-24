#!/bin/bash

# Exit immediately if any command fails
set -e

# Check if .env file exists
if [ ! -f .env ]; then
  echo ".env file not found!"
  exit 1
fi

# Extract the MongoDB connection string from .env
# Make sure your .env file has this format:
# MONGO_URI=mongodb+srv://<username>:<password>@<cluster>/<dbname>
MONGO_URI=$(grep ^MONGO_URI= .env | cut -d '=' -f2-)

# Validate that MONGO_URI is not empty
if [ -z "$MONGO_URI" ]; then
  echo "MONGO_URI not set in .env"
  exit 1
fi

# Automatically encode the Mongo URI in base64.
ENCODED_URI=$(echo -n "$MONGO_URI" | base64)

# Generate the mongo-secret.yaml file with the encoded URI
cat <<EOF > kubernetes/mongo-secrets.yaml
apiVersion: v1
kind: Secret
metadata:
  name: mongo-secret
type: Opaque
data:
  # Base64-encoded value of your MongoDB connection string
  mongo-uri: $ENCODED_URI
EOF

echo "mongo-secret.yaml generated at kubernetes/mongo-secrets.yaml"

