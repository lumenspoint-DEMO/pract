#!/usr/bin/env bash
BASE="https://raw.githubusercontent.com/lumenspoint-DEMO/pract/main"
DEST="$HOME/pract-docs"
mkdir -p "$DEST"
echo "Downloading into $DEST ..."
curl -fsSL "$BASE/files.txt" | while read -r f; do
  f="${f%$'\r'}"
  [ -z "$f" ] && continue
  curl -fsSL "$BASE/docs/$f" -o "$DEST/$f" && echo "OK: $f" || echo "FAILED: $f"
done
echo "Done! Files are in: $DEST"