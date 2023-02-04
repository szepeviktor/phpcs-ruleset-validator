#!/bin/bash
#
# Validate PHPCS rulesets.
#

set -e

# Default PHPCS schema path: vendor/squizlabs/php_codesniffer/phpcs.xsd
PHPCS_SCHEMA="${INPUT_XML_PHPCS_SCHEMA:-vendor/squizlabs/php_codesniffer/phpcs.xsd}"
# Default indentation: 4 spaces
XMLLINT_INDENT="${INPUT_XMLLINT_INDENT:-    }"
export XMLLINT_INDENT

if [ -z "${!INPUT_*}" ]; then
    echo "No ruleset files specified!"
    exit 10
fi

# Validate PHPCS schema
xmllint --noout --schema /usr/local/share/xml/XMLSchema.xsd "${PHPCS_SCHEMA}"

# Validate rulesets
for INPUT in "${!INPUT_@}"; do
    if [ "${INPUT}" == INPUT_XML_PHPCS_SCHEMA ] || [ "${INPUT}" == INPUT_XMLLINT_INDENT ] || [ -z "${!INPUT}" ]; then
        continue
    fi

    xmllint --noout --schema "${PHPCS_SCHEMA}" "${!INPUT}"
    # Allow extra blank lines
    diff --ignore-blank-lines "${!INPUT}" <(xmllint --format "${!INPUT}") | cat --show-all
done
