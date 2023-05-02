#!/bin/env bash

set -e

echo "@buildpack"

ls -lah /work

cd work

cmd="$1"
shift
exec "$cmd" "$@"