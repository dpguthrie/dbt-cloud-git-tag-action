# Git Tag

This is a Github Action that is designed to work with a git tag release strategy alongside dbt Cloud.

## Inputs

| **Name**                  | **Description**                                                                                                 | Required | Default            |
|---------------------------|-----------------------------------------------------------------------------------------------------------------|----------|--------------------|
| `dbt_cloud_service_token` | The service token generated from dbt Cloud.  **Ensure you have the proper permissions to trigger jobs**         | `True`   |                    |
| `dbt_cloud_account_id`    | This is the account ID which contains the projects you'll be triggering CI jobs for.                            | `True`   |                    |
| `dbt_cloud_project_id`        | This is the project ID corresponding to the environment linked to the project you configure this action in.              | `True`   |                    |
| `dbt_cloud_environment_id`        | This is the environment ID corresponding to the environment you want to update with the latest git tag.              | `True`   |                    |
| `dbt_cloud_host`          | Where your dbt Cloud is located.                                                                                | `False`  | `cloud.getdbt.com` |


## Example

```yaml
name: Update Prod Environment

on:
  push:
    tags:
      - '*'

jobs:
  update-environment:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v2
    - name: dbt Cloud Downstream CI Action
      uses: dpguthrie/dbt-cloud-git-tag-action@0.1.0
      with:
        dbt_cloud_account_id: ${{ secrets.DBT_CLOUD_ACCOUNT_ID }}
        dbt_cloud_project_id: ${{ secrets.DBT_CLOUD_PROJECT_ID }}
        dbt_cloud_environment_id: ${{ secrets.DBT_CLOUD_ENVIRONMENT_ID }}
        dbt_cloud_service_token: ${{ secrets.DBT_CLOUD_SERVICE_TOKEN }}
```

## License

This project is licensed under the terms of the MIT license.
