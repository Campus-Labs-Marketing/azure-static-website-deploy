# GitHub Action to Upload to Azure Storage

> **⚠️ Note:** To use this action, you must have access to the [GitHub Actions](https://github.com/features/actions) feature.

This action is designed to use the [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest) to upload a directory of your choice to your Azure Storage account.

## Usage

### Example

Place in a `.yml` file such as this one in your `.github/workflows` folder. [Refer to the documentation on workflow YAML syntax here.](https://help.github.com/en/articles/workflow-syntax-for-github-actions)

```yaml
name: Upload To Azure
on: push

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@master
      - uses: rmilstrey/azure-static-website-deploy@master
        env:
          SOURCE_DIR: "./public"
        	DESTINATION_DIR: "<blob-container>"
          AZURE_SECRET: "<azure-secret>"
          AZURE_SUBSCRIPTION_ID: "<azure-subscription-id>"
          AZURE_STORAGE_ACCOUNT_NAME: "<azure-storage-account-name>"
          AZURE_STORAGE_ACCOUNT_KEY: "<azure-storage-account-key>"
```
### Required Variables

| Key | Value | Type | Required |
| ------------- | ------------- | ------------- | ------------- |
| `SOURCE_DIR` | The name of the directory you want to upload | `env` | **Yes** |
| `DESTINATION_DIR` | The name of the blob container you want to upload to | `env` | **Yes** |
| `AZURE_SECRET` | Your Azure Secret. | `secret` | **Yes** |
| `AZURE_SUBSCRIPTION_ID` | Your Azure Subscription ID. | `secret` | **Yes** |
| `AZURE_STORAGE_ACCOUNT_NAME` | Your Azure Storage Account Name. | `secret` | **Yes** |
| `AZURE_STORAGE_ACCOUNT_KEY` | Your Azure Storage Account Key. | `secret` | **Yes** |

## License

This project is distributed under the [MIT license](LICENSE.md).
