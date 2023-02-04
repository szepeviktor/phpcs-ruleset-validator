# Validate PHPCS rulesets

This is an action for GitHub Actions. It runs `xmllint` on each listed ruleset file.

```yaml
    - name: "Validate ruleset"
      uses: "szepeviktor/phpcs-ruleset-validator@v0.1.0"
      with:
        xml_ruleset: "RulesetName/ruleset.xml"
```

You can use any key in `with`.
There is one special key for non-default PHPCS shema path: `xml_phpcs_schema`.
