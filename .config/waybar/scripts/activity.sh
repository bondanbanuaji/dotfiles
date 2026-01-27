#!/usr/bin/env bash

# ╔══════════════════════════════════════════════════════════════╗
# ║        HYPRLAND ACTIVITY BY BOBA                             ║
# ╚══════════════════════════════════════════════════════════════╝

LAST_OUTPUT=""
ACTIVE_CLASS=""
ACTIVE_TITLE=""
ACTIVE_WS=""
TOGGLE=0
MAX_VISIBLE=50

clean_title() {
    local t="$1"

    t="${t% - Google Chrome}"
    t="${t% - Chromium}"
    t="${t% - Brave}"
    t="${t% - Mozilla Firefox}"
    t="${t% — Mozilla Firefox}"
    t="${t% - Firefox Developer Edition}"
    t="${t% - Zen Browser}"
    t="${t% and [0-9]* more page*}"

    t="$(echo "$t" | xargs)"
    (( ${#t} > MAX_VISIBLE )) && t="${t:0:MAX_VISIBLE}…"
    echo "$t"
}

emit() {
    [[ "$1" == "$LAST_OUTPUT" ]] && return

    TOGGLE=$((1 - TOGGLE))
    LAST_OUTPUT="$1"

    echo "{\"text\":\"$1\",\"class\":\"slide-$TOGGLE\"}"
}

print_activity() {
    local ws="" title="" out=""

    [[ -n "$ACTIVE_WS" ]] && ws="WS $ACTIVE_WS · "
    title="$(clean_title "$ACTIVE_TITLE")"

    case "$ACTIVE_CLASS" in
        firefox|Firefox|firefoxdeveloperedition)
            out="${ws}󰈹 Firefox${title:+ · $title}" ;;
        chromium|Chromium)
            out="${ws}󰊯 Chromium${title:+ · $title}" ;;
        google-chrome|Google-chrome)
            out="${ws}󰊯 Chrome${title:+ · $title}" ;;
        brave|Brave-browser)
            out="${ws}󰞍 Brave${title:+ · $title}" ;;
        zen-alpha|zen-browser|Zen\ Browser)
            out="${ws}󰈹 Zen${title:+ · $title}" ;;
        Code|code-url-handler|VSCodium)
            out="${ws}󰨞 VSCode${title:+ · $title}" ;;
        kitty|Alacritty|foot|wezterm)
            out="${ws}󰆍 Terminal${title:+ · $title}" ;;
        Thunar|thunar|nautilus|Nemo|pcmanfm)
            out="${ws}󰉋 Files${title:+ · $title}" ;;
        discord|Discord|vesktop|Vesktop)
            out="${ws}󰙯 Discord${title:+ · $title}" ;;
        telegram|Telegram|telegram-desktop)
            out="${ws}󰔁 Telegram${title:+ · $title}" ;;
        spotify|Spotify)
            out="${ws}󰓇 ${title:-Spotify}" ;;
        vlc|mpv)
            out="${ws}󰕼 ${title:-Watching Video}" ;;
        steam|Steam)
            out="${ws}󰮂 Gaming" ;;
        "")
            out="${ws}󰒲 Idle" ;;
        *)
            out="${ws}󰘔 $ACTIVE_CLASS${title:+ · $title}" ;;
    esac

    emit "$out"
}

sync_state() {
    local w ws
    w="$(hyprctl activewindow -j 2>/dev/null)"
    ws="$(hyprctl activeworkspace -j 2>/dev/null)"

    ACTIVE_CLASS="$(echo "$w" | jq -r '.class // ""' 2>/dev/null)"
    ACTIVE_TITLE="$(echo "$w" | jq -r '.title // ""' 2>/dev/null)"
    ACTIVE_WS="$(echo "$ws" | jq -r '.id // ""' 2>/dev/null)"
}

# Initial state
sync_state
print_activity

# Monitor Hyprland events
socat -u UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - 2>/dev/null |
while IFS= read -r line; do
    ev="${line%%>>*}"
    data="${line#*>>}"

    case "$ev" in
        activewindow)
            ACTIVE_CLASS="${data%%,*}"
            ACTIVE_TITLE="${data#*,}" 
            print_activity
            ;;
        windowtitle)
            ACTIVE_TITLE="${data#*,}" 
            print_activity
            ;;
        workspace)
            ACTIVE_WS="$data"
            print_activity
            ;;
    esac
done
