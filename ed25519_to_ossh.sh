#!/bin/sh

set -euf

ssl_priv=$(cat ${1:+"$1"})

pub64=$(echo "$ssl_priv" | openssl pkey -pubout -outform der 2>/dev/null | dd bs=12 skip=1 status=none | base64)

test "$pub64" || { echo "Cannot get public key" >&2; exit 1; }

priv64=$(echo "$ssl_priv" | grep -v '^-' | base64 -d | dd bs=16 skip=1 status=none | base64)

echo '-----BEGIN OPENSSH PRIVATE KEY-----'

{
    printf openssh-key-v1'\000\000\000\000\004'none'\000\000\000\004'none'\000\000\000\000\000\000\000\001\000\000\000'3
    printf '\000\000\000\013'ssh-ed25519'\000\000\000 '
    echo $pub64 | base64 -d
    printf '\000\000\000'
    printf '\210\000\000\000\000\000\000\000\000'
    printf '\000\000\000\013'ssh-ed25519'\000\000\000 '
    echo $pub64 | base64 -d
    printf '\000\000\000@'
    echo $priv64| base64 -d
    echo $pub64 | base64 -d
    printf '\000\000\000\000\001\002\003\004\005'
} | base64

echo '-----END OPENSSH PRIVATE KEY-----'
