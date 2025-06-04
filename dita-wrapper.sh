#!/bin/bash

# Simple DITA-OT wrapper script
# This can be used instead of ../bin/dita for easier completion

exec "$(dirname "$0")/../bin/dita" "$@" 