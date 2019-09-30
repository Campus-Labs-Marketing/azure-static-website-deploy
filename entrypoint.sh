#!/bin/sh

set -e

if [ -z "$INPUT_SOURCE_DIR" ]; then
  echo "SOURCE_DIR is not set. Quitting."
  exit 1
fi

if [ -z "$INPUT_DESTINATION_DIR" ]; then
  echo "DESTINATION_DIR is not set. Quitting."
  exit 1
fi

if [ -z "$INPUT_AZURE_STORAGE_ACCOUNT_NAME" ]; then
  echo "AZURE_STORAGE_ACCOUNT_NAME is not set. Quitting."
  exit 1
fi

if [ -z "$INPUT_AZURE_STORAGE_ACCOUNT_KEY" ]; then
  echo "AZURE_STORAGE_ACCOUNT_KEY is not set. Quitting."
  exit 1
fi

if [ -z "$INPUT_AZURE_CONNECTION_STRING" ]; then
  echo "AZURE_CONNECTION_STRING is not set. Quitting."
  exit 1
fi

if [ -z "$INPUT_AZURE_SUBSCRIPTION_ID" ]; then
  echo "AZURE_SUBSCRIPTION_ID is not set. Quitting."
  exit 1
fi

# Upload source to storage
az storage blob upload-batch -s ${INPUT_SOURCE_DIR} -d ${INPUT_DESTINATION_DIR} --account-name ${INPUT_AZURE_STORAGE_ACCOUNT_NAME} --account-key ${INPUT_AZURE_STORAGE_ACCOUNT_KEY} --connection-string ${INPUT_AZURE_CONNECTION_STRING} --subscription ${INPUT_AZURE_SUBSCRIPTION_ID}
