#!/bin/sh

set -e

if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "AZURE_SUBSCRIPTION_ID is not set. Quitting."
  exit 1
fi

if [ -z "$AZURE_SECRET" ]; then
  echo "AZURE_SECRET is not set. Quitting."
  exit 1
fi

if [ -z "$AZURE_STORAGE_ACCOUNT_NAME" ]; then
  echo "AZURE_STORAGE_ACCOUNT_NAME is not set. Quitting."
  exit 1
fi

if [ -z "$SOURCE_DIR" ]; then
  echo "SOURCE_DIR is not set. Quitting."
  exit 1
fi

if [ -z "$DESTINATION_DIR" ]; then
  echo "DESTINATION_DIR is not set. Quitting."
  exit 1
fi

if [ -z "$AZURE_STORAGE_ACCOUNT_KEY" ]; then
  echo "AZURE_STORAGE_ACCOUNT_KEY is not set. Quitting."
  exit 1
fi

# Login
az login --username ${AZURE_CLIENT_ID} --password ${AZURE_SECRET}

# Set subscription id
az account set --subscription ${AZURE_SUBSCRIPTION_ID}

# Upload source to storage
az storage blob upload-batch -s ${SOURCE_DIR} -d ${DESTINATION_DIR} --account-name ${AZURE_STORAGE_ACCOUNT_NAME} --account-key ${AZURE_STORAGE_ACCOUNT_KEY}
