#!/bin/env bash

set -e

source ~/.bashrc
. $HOME/.asdf/asdf.sh

ls -lah /work

echo "@buildpack running |> $@"

cd work

$@