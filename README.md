# pre-commit

hooks for http://pre-commit.com/

## Using these hooks

Add this to your `.pre-commit-config.yaml`

```
- repo: https://github.com/swanwish/pre-commit
  rev: master
  hooks:
    - id: ktlint
```