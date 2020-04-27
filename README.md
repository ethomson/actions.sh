# bash helpers for GitHub Actions

GitHub Actions has several [workflow commands](https://help.github.com/en/actions/reference/workflow-commands-for-github-actions) that are available for use within the ecosystem.  If you're building an _action_, then you can use the [GitHub Actions Toolkit](https://github.com/actions/toolkit), which will provide first class support for these commands.  If you're building a workflow, then this bash library may help.

## Usage

Check this script in to your repository (you can put it in the `.github/workflows` folder, where it will be ignored).  Then you can `source` this script in a `run` step of your workflow.

For example, to set a variable in a step in your workflow:

```yaml
name: Set a variable
on:
  push:
    branches: [ master ]
jobs:
  variable:
    runs-on: ubuntu-latest
    steps:
    - name: Set a variable
      id: setter
      run: |
        source .github/workflows/actions.sh
        set_output varname $'my\nvariable\ndata'
    - name: Display a variable
      run: echo ${{ steps.setter.outputs.varname }}
```

## Commands

### `set_output`

Sets a variable that can be used by subsequent steps.  Carriage returns (`\r`) and newlines (`\n`) will be escaped for preservation.

