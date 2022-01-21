# `secret_hash.sh`

Secure version of `sha512sum`: a shared secret is read from the file whose
path is in the environment variable `$HASH_SECRET_PATH` and prepend to the
hash algorithm. Also the algorithm is run twice to avoid extension attacks.
No options are accepted and all files are treated as binary.
