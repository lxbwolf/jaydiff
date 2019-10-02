#!/usr/bin/env bash

FAILED=0

echo "./jaydiff --show-types:"
./jaydiff --indent='    ' --show-types test_files/lhs.json test_files/rhs.json
CODE=$?
if [[ $CODE -ne 6 ]]; then
	echo "FAIL with code $CODE"
	FAILED=1
else
	echo "OK"
fi
echo

echo "./jaydiff --show-types --ignore:"
./jaydiff --indent='    ' --show-types \
	--ignore='.b\[\]' --ignore='.d' --ignore='.c.[ac]' \
	test_files/lhs.json test_files/rhs.json
CODE=$?
if [[ $CODE -ne 6 ]]; then
	echo "FAIL with code $CODE"
	FAILED=1
else
	echo "OK"
fi
echo

echo "./jaydiff --show-types --ignore(all):"
./jaydiff --indent='    ' --show-types \
	--ignore='.b\[\]' --ignore='.[c-h]' \
	test_files/lhs.json test_files/rhs.json
CODE=$?
if [[ $CODE -ne 0 ]]; then
	echo "FAIL with code $CODE"
	FAILED=1
else
	echo "OK"
fi
echo

echo "./jaydiff --report --show-types:"
./jaydiff --report --indent='    ' --show-types \
	test_files/lhs.json test_files/rhs.json
CODE=$?
if [[ $CODE -ne 6 ]]; then
	echo "FAIL with code $CODE"
	FAILED=1
else
	echo "OK"
fi
echo

if [[ $FAILED -ne 0 ]]; then
	echo "$FAILED errors"
	exit 1
fi

echo "./jaydiff --report --ignore-excess --show-types:"
./jaydiff --report --ignore-excess --indent='    ' --show-types \
	test_files/lhs.json test_files/rhs.json
CODE=$?
if [[ $CODE -ne 6 ]]; then
	echo "FAIL with code $CODE"
	FAILED=1
else
	echo "OK"
fi
echo

echo "./jaydiff --report --stream-lines:"
./jaydiff --report --stream-lines \
	test_files/lhs_lines.json test_files/rhs_lines.json
CODE=$?
if [[ $CODE -ne 6 ]]; then
	echo "FAIL with code $CODE"
	FAILED=1
else
	echo "OK"
fi
echo

echo "./jaydiff --report --stream-lines --ignore [].c.b:"
./jaydiff --report --stream-lines --ignore '\[\].c.b' \
	test_files/lhs_lines.json test_files/rhs_lines.json
CODE=$?
if [[ $CODE -ne 0 ]]; then
	echo "FAIL with code $CODE"
	FAILED=1
else
	echo "OK"
fi
echo


echo "./jaydiff --report --stream:"
./jaydiff --report --stream \
	test_files/lhs_stream.json test_files/rhs_stream.json
CODE=$?
if [[ $CODE -ne 6 ]]; then
	echo "FAIL with code $CODE"
	FAILED=1
else
	echo "OK"
fi
echo

echo "./jaydiff --ignore-excess --ignore-values --json --report --stream-validate:"
./jaydiff --ignore-excess --ignore-values --json --report --stream-validate \
	test_files/lhs_validate.json test_files/rhs_validate.json
CODE=$?
if [[ $CODE -ne 6 ]]; then
	echo "FAIL with code $CODE"
	FAILED=1
else
	echo "OK"
fi
echo

if [[ $FAILED -ne 0 ]]; then
	echo "$FAILED errors"
	exit 1
fi
