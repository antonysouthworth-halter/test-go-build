#!/bin/bash
set -euo pipefail

msg () {
  echo >&2 "$@"
}

modname="test-go-build"
reset () {
  if [ -f "$modname" ]
  then
    rm -f "$modname"
  fi
}

check () {
  if [ -f "$modname" ]
  then
    msg "$modname is *present*"
  else
    msg "$modname is *absent*"
  fi
}

try () {
  reset
  msg "use cmd: $@"
  "$@"
  check
  reset
}

try go build
try go build .
try go build ./...

