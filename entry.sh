#!/bin/env bash

echo "@buildpack"

ls -lah /work

cd work

exec "$@"