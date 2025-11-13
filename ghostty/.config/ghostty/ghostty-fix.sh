#!/bin/sh

# Fixes dead keys
# https://github.com/ghostty-org/ghostty/discussions/8899#discussioncomment-14717979

export GTK_IM_MODULE=simple
exec ghostty "$@"
