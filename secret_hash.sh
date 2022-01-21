#!/bin/bash

# secure version of `sha512sum`: a shared secret is read from the file whose
# path is in the environment variable `$HASH_SECRET_PATH` and prepend to the
# hash algorithm. Also the algorithm is run twice to avoid extension attacks.
# No options are accepted and all files are treated as binary.

if [[ ! -f "$HASH_SECRET_PATH" ]]; then
	echo '$HASH_SECRET_PATH not a regular file' >&2
	exit 10
fi

for file; do
	if [[ -f "$file" ]]; then
		PRE_HASH=`cat "$HASH_SECRET_PATH" "$file" | sha512sum -b | cut -f1 '-d '`
		HASH=`echo $PRE_HASH | sha512sum | cut -f1 '-d '`
		echo "$HASH *$file"
	else
		echo "'$file' is not a regular file" >&2
	fi
done
