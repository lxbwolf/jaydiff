#!/usr/bin/env bash

cat << EOF
Getting a full diff of two json files:

$(echo '```diff')
$ jaydiff --show-types old.json new.json

$(./jaydiff --indent='    ' --show-types test_files/lhs.json test_files/rhs.json)
$(echo '```')

Ignoring fields:

$(echo '```diff')
$ jaydiff --show-types \\
	  --ignore='.b\[\]' --ignore='.d' --ignore='.c.[ac]' \\
	    old.json new.json

$(./jaydiff --indent='    ' --show-types \
	--ignore='.b\[\]' --ignore='.d' --ignore='.c.[ac]' \
	test_files/lhs.json test_files/rhs.json
)
$(echo '```')

Report format:

$(echo '```diff')
$ jaydiff --report --show-types old.json new.json

$(./jaydiff --report --indent='    ' --show-types test_files/lhs.json test_files/rhs.json)
$(echo '```')

JSON-like format:

$(echo '```diff')
$ jaydiff --json old.json new.json

$(./jaydiff --json --indent='    ' test_files/lhs.json test_files/rhs.json)
$(echo '```')

Ignore Excess values (useful when checking for backward compatibility):

$(echo '```diff')
$ jaydiff --report --show-types --ignore-excess old.json new.json

$(./jaydiff --report --ignore-excess --indent='    ' --show-types test_files/lhs.json test_files/rhs.json)
$(echo '```')

Ignore values (type must still match):

$(echo '```diff')
$ jaydiff --report --show-types --ignore-excess --ignore-values old.json new.json

$(./jaydiff --report --ignore-excess --ignore-values --indent='    ' --show-types test_files/lhs.json test_files/rhs.json)
$(echo '```')

JSON streams:

$(echo '```diff')
$ jaydiff --stream --json old.json new.json

$(./jaydiff --stream --json --indent='    ' test_files/lhs_stream.json test_files/rhs_stream.json)
$(echo '```')

Validating JSON stream types:

$(echo '```diff')
$ jaydiff --ignore-excess --ignore-values --stream-validate --report --show-types base.json stream.json

$(./jaydiff --ignore-excess --ignore-values --stream-validate --report --show-types test_files/lhs_validate.json test_files/rhs_validate.json)
$(echo '```')


EOF
