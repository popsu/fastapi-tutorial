#!/usr/bin/env bash

set -euo pipefail

HASHDATE=$(git log -n1 --pretty='format:%cd_%h' --date=format:'%Y-%m-%d_%H%M%S' --abbrev=8)
SEP="_"
VER="v"

if [ -n "${1-}" ]; then
    # Add $1 in between $VER and $HASHDATE if it is nonempty
    echo "$VER$1$SEP$HASHDATE"
else

    echo "$VER$HASHDATE"
fi
