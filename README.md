# Validate PHPCS rulesets

This is an action for GitHub Actions. It runs `xmllint` on each listed ruleset files.

```yaml
    - name: "Validate ruleset"
      uses: "./.github/actions/phpcs-ruleset-validate"
      with:
        xml_ruleset: "RulesetName/ruleset.xml"
```

You can use any key in `with`.
There is one special key for non-default PHPCS shema path: `xml_phpcs_schema`.
