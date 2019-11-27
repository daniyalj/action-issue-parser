# Issue parser action

This action parses the latest issue and grabs the body of the issue. Adds it to a file and commits it to a repo in a folder called issues. The folder must be created before hand.

## Inputs

### `org_name`

**Required** GitHub organization name 

### `repo_name`

**Required** GitHub repository name 

### `global_email`

**Required** Email for commiting to GitHub


## Example usage

```
jobs:
  issue_parser:
    runs-on: ubuntu-latest
    name: Grab body of latest issue
    steps:
    - name: Parse latest GitHub issue
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      uses: daniyalj/ga-hello-world@v1
      with:
        org_name: 'daniyalj'
        repo_name: 'ga-hello-world'
        global_email: 'daniyaljavedk@gmail.com'
```
