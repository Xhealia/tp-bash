#!/bin/bash
# Recrée les fichiers temporaires du projet librairie, pour pouvoir refaire les tests
set -euo pipefail

cd "$(dirname "$0")"
mkdir -p librairie/tmp librairie/cache
for fichier in tmp/upload-4821.tmp tmp/upload-4822.tmp tmp/session-9f3a.tmp cache/vite-deps.tmp cache/eslint.tmp; do
    head -c 51200 /dev/zero > "librairie/$fichier"
done
echo "Fichiers temporaires recréés : 5"
