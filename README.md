# Validate PHPCS rulesets

This is an action for GitHub Actions. It runs `xmllint` on each listed ruleset file.

```yaml
    - name: "Validate ruleset"
      uses: "szepeviktor/phpcs-ruleset-validator@v0.4.0"
      with:
        # When you indent with tabs
        # xmllint_indent: "\t"
        xml_ruleset: "RulesetName/ruleset.xml"
```

You can use any key in `with`.
There are two special keys
1. for non-default PHPCS shema path: `xml_phpcs_schema`
2. for XML file indentation string: `xmllint_indent`
