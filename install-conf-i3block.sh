#!/usr/bin/env bash

echo ">>> Installation du thème i3blocks pastel-dark..."

CONFIG_DIR="$HOME/.config/i3blocks"
SCRIPT_DIR="$CONFIG_DIR/scripts"

echo ">>> Création des dossiers..."
mkdir -p "$SCRIPT_DIR"

echo ">>> Installation de la configuration i3blocks..."
cat > "$CONFIG_DIR/config" << 'EOF'
interval=5
separator=false
markup=pango

[cpu]
command=~/.config/i3blocks/scripts/cpu
interval=5

[memory]
command=~/.config/i3blocks/scripts/memory
interval=5

[disk]
command=~/.config/i3blocks/scripts/disk
interval=60

[home_disk]
command=~/.config/i3blocks/scripts/disk-home
interval=60

[wifi]
command=~/.config/i3blocks/scripts/wifi
interval=10

[volume]
command=~/.config/i3blocks/scripts/volume
interval=2

[time]
command=~/.config/i3blocks/scripts/time
interval=1
EOF

echo ">>> Scripts CPU / MEM / DISK / WIFI / VOLUME / TIME..."

cat > "$SCRIPT_DIR/cpu" << 'EOF'
#!/usr/bin/env bash
usage=$(grep 'cpu ' /proc/stat | awk '{u=($2+$4)*100/($2+$4+$5)} END {printf("%.1f%%", u)}')
echo "<span foreground='#abe15b'></span> $usage"
EOF

cat > "$SCRIPT_DIR/memory" << 'EOF'
#!/usr/bin/env bash
used=$(free -h | awk '/Mem:/ {print $3}')
echo "<span foreground='#9a5fec'></span> $used"
EOF

cat > "$SCRIPT_DIR/disk" << 'EOF'
#!/usr/bin/env bash
disk=$(df -h / | awk 'NR==2 {print $3 "/" $2}')
echo "<span foreground='#ffd242'></span> $disk"
EOF

cat > "$SCRIPT_DIR/wifi" << 'EOF'
#!/usr/bin/env bash
ssid=$(iwgetid -r)
signal=$(awk 'NR==3 {print int($3 * 1)}' /proc/net/wireless | sed 's/\.//')
echo "<span foreground='#0092ff'></span> ${ssid:-No WiFi} (${signal:-0}%)"
EOF

cat > "$SCRIPT_DIR/volume" << 'EOF'
#!/usr/bin/env bash
vol=$(pamixer --get-volume)
mute=$(pamixer --get-mute)

icon=""
[ "$mute" = "true" ] && icon=""

echo "<span foreground='#67fff0'>$icon</span> $vol%"
EOF

cat > "$SCRIPT_DIR/time" << 'EOF'
#!/usr/bin/env bash
now=$(date '+%a %d %b  %H:%M')
echo "<span foreground='#fffaf4'></span> $now"
EOF

cat > "$SCRIPT_DIR/disk-home" << 'EOF'
#!/usr/bin/env bash
disk=$(du -sh /home/rrtracer 2>/dev/null | awk '{print $1}')
echo "<span foreground='#ffb900'></span> $disk"
EOF

echo ">>> Rend les scripts exécutables..."
chmod +x "$SCRIPT_DIR"/*

echo ">>> Installation terminée !"
echo ">>> Recharge i3 (Mod + Shift + R)"
