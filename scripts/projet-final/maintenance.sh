#!/bin/bash
# Script de maintenance du projet librairie
set -euo pipefail

projet="librairie"
dossier_sauvegardes="sauvegardes"
simulation=false

info() {
    echo "[INFO] $1"
}

succes() {
    echo "[OK] $1"
}

erreur() {
    echo "[ERREUR] $1" >&2
}

usage() {
    echo "Usage : $0 <sauvegarde|nettoyage|rapport> [--simulation]" >&2
    exit 2
}

sauvegarder() {
    # À compléter à l'étape 4
    info "Action sauvegarde : à compléter"
}

nettoyer() {
    # À compléter à l'étape 5
    info "Action nettoyage : à compléter"
}

afficher_rapport() {
    # À compléter à l'étape 6
    info "Action rapport : à compléter"
}

action=${1:-}
option=${2:-}

case $option in
    "")
        ;;
    --simulation)
        simulation=true
        ;;
    *)
        usage
        ;;
esac

case $action in
    sauvegarde|nettoyage|rapport)
        ;;
    *)
        usage
        ;;
esac

if [[ ! -d $projet ]]; then
    erreur "Dossier $projet introuvable : on lance le script depuis le dossier projet-final"
    exit 1
fi

case $action in
    sauvegarde)
        sauvegarder
        ;;
    nettoyage)
        nettoyer
        ;;
    rapport)
        afficher_rapport
        ;;
esac
