#!/bin/bash

get_status() {
    playerctl -p spotify status 2>/dev/null || echo "Stopped"
}

get_title() {
    playerctl -p spotify metadata title 2>/dev/null | cut -c 1-20
}

get_artist() {
    playerctl -p spotify metadata artist 2>/dev/null | cut -c 1-15
}

get_cover() {
    playerctl -p spotify metadata mpris:artUrl 2>/dev/null | sed 's|open.spotify.com|i.scdn.co|'
}

case "$1" in
    status) get_status ;;
    title) get_title ;;
    artist) get_artist ;;
    cover) get_cover ;;
    *) echo "Usage: $0 {status|title|artist|cover}" ;;
esac
