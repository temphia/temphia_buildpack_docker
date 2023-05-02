#!/bin/env bash

set -e

ls -lah /work

echo "@buildpack running |> $@"

cd work

$@