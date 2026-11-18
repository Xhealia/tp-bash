# TP Scripting Bash

TP en autonomie sur le scripting Bash, destiné aux étudiants de Bachelor 3 Développement Web Full Stack et Cybersécurité de l'École Supérieure du Numérique des Landes.

## Présentation

Chaque jour, un développeur répète les mêmes gestes dans son terminal : il installe des dépendances, lance des tests, consulte des logs, prépare un déploiement, nettoie des fichiers temporaires. Le scripting Bash permet de regrouper ces gestes dans un fichier et de les lancer en une seule commande, de façon fiable et reproductible.

Bash est le langage du terminal sous Linux. On le retrouve partout : sur les serveurs, dans les conteneurs Docker, dans les pipelines d'intégration et de déploiement continus.

L'arrivée des agents d'IA, capables d'écrire du code et de lancer des commandes à notre place, n'a pas rendu le scripting inutile. Ces agents s'appuient eux-mêmes en permanence sur Bash, et ils produisent des scripts qu'il faut savoir lire avant de les exécuter. Savoir lire et écrire un script Bash reste donc une compétence essentielle pour un développeur full stack.

Dans ce TP, on part de son tout premier script pour arriver à un outil d'automatisation complet, utilisable dans ses propres projets.

## Objectifs

À la fin de ce TP, on sait :

- Écrire, rendre exécutable et lancer un script Bash
- Utiliser des variables, des paramètres et des saisies
- Faire des choix et répéter des actions dans un script
- Organiser son code en fonctions et gérer les erreurs
- Combiner les commandes du terminal pour rechercher, filtrer et transformer des données
- Automatiser une tâche réelle de bout en bout

## Organisation

Le TP se compose de sept parties, à suivre dans l'ordre, car chacune s'appuie sur les précédentes :

- Partie 1 : Mise en route
- Partie 2 : Premier script
- Partie 3 : Décider et répéter
- Partie 4 : Fiabiliser ses scripts
- Partie 5 : Combiner les outils du terminal
- Partie 6 : Projet final
- Partie 7 : Pour aller plus loin (facultative)

Les consignes détaillées de chaque partie se trouvent dans le support du TP, fourni par le formateur.

## Environnement de travail

On travaille dans une machine Linux Ubuntu 24.04 isolée dans un conteneur Docker. On peut ainsi tester librement ses scripts sans aucun risque pour son propre système.

Il faut disposer sur son poste :

- D'une distribution Linux
- De Docker et de Docker Compose
- De Git
- D'un compte GitHub

Les scripts sont écrits avec l'éditeur nano. Vim est aussi installé dans la machine pour ceux qui le souhaitent.

## Contenu du dépôt

```text
tp-bash/
├── .gitignore        Liste des fichiers que Git doit ignorer
├── compose.yaml      Description de la machine de travail
├── Dockerfile        Recette de construction de la machine
├── README.md         Présentation du TP
├── RENDU.md          Fichier de rendu à compléter à la fin de chaque partie
├── config/vimrc      Configuration minimale de l'éditeur Vim
└── scripts/          Dossier de travail, partagé entre le poste et la machine
    └── projet-final/ Base du projet final, utilisée en partie 6
```

## Démarrage rapide

La partie 1 du support détaille chaque étape et les solutions aux problèmes courants. En résumé, sur son poste :

```bash
cd ~
git clone https://github.com/trentindev/TD-bashing-B3.git tp-bash
cd tp-bash
echo "UID_HOTE=$(id -u)" > .env && echo "GID_HOTE=$(id -g)" >> .env
docker compose up -d --build
docker compose exec labo bash
```

Le fichier `.env` aligne l'identité de l'utilisateur de la machine sur celle du poste, pour que les fichiers du dossier `scripts/` puissent être modifiés des deux côtés. Il dépend de chaque poste et n'est pas publié.

Avant le premier envoi, on relie le dossier à son propre dépôt GitHub, comme indiqué à l'étape 7 de la partie 1.

## Rendu du travail

On publie son travail sur son propre dépôt GitHub public `tp-bash`, en suivant l'étape 7 de la partie 1. À la fin de chaque partie, on complète la section correspondante de `RENDU.md`, puis on publie depuis le poste :

```bash
cd ~/tp-bash
git add scripts/ RENDU.md
git commit -m "Partie N : titre de la partie"
git push
```

On transmet le lien de son dépôt au formateur, par mail ou par Classroom.