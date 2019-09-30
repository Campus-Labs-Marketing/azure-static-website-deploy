#!/bin/sh

set -e

if [ -z "$SOURCE_DIR" ]; then
  echo "SOURCE_DIR is not set. Quitting."
  exit 1
fi

if [ -z "$DESTINATION_DIR" ]; then
  echo "DESTINATION_DIR is not set. Quitting."
  exit 1
fi

if [ -z "$AZURE_STORAGE_ACCOUNT_NAME" ]; then
  echo "AZURE_STORAGE_ACCOUNT_NAME is not set. Quitting."
  exit 1
fi

if [ -z "$AZURE_STORAGE_ACCOUNT_KEY" ]; then
  echo "AZURE_STORAGE_ACCOUNT_KEY is not set. Quitting."
  exit 1
fi

if [ -z "$AZURE_CONNECTION_STRING" ]; then
  echo "AZURE_CONNECTION_STRING is not set. Quitting."
  exit 1
fi

if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "AZURE_SUBSCRIPTION_ID is not set. Quitting."
  exit 1
fi

REPLACEMENT="assets"
SOURCE_DIR_FORMATTED=${SOURCE_DIR/refs\/heads/$REPLACEMENT}

# Upload source to storage
az storage blob upload-batch -s ${SOURCE_DIR} -d ${DESTINATION_DIR} --account-name ${AZURE_STORAGE_ACCOUNT_NAME} --account-key ${AZURE_STORAGE_ACCOUNT_KEY} --connection-string ${AZURE_CONNECTION_STRING} --subscription ${AZURE_SUBSCRIPTION_ID}
