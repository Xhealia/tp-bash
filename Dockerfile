# TP Scripting Bash - ESNL - Bachelor 3
# Image de travail : Ubuntu 24.04 avec les outils utilisés pendant le TP.
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Europe/Paris \
    LANG=C.UTF-8

# Outils du TP : éditeurs (nano, et Vim pour l'annexe), traitement de texte (gawk, sed, grep), recherche de fichiers, processus
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      bash-completion ca-certificates curl findutils gawk git grep less \
      nano procps sed sudo tzdata vim \
 && rm -rf /var/lib/apt/lists/*

# L'utilisateur ubuntu existe déjà dans l'image (UID et GID 1000).
# On lui donne les identifiants de l'utilisateur du poste pour partager le dossier scripts/ sans problème de droits.
ARG UID_HOTE=1000
ARG GID_HOTE=1000
RUN groupmod -g "${GID_HOTE}" ubuntu \
 && usermod -u "${UID_HOTE}" -g "${GID_HOTE}" ubuntu

# On donne à ubuntu le droit d'utiliser sudo sans mot de passe
RUN echo "ubuntu ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ubuntu \
 && chmod 0440 /etc/sudoers.d/ubuntu

# Configuration minimale de Vim
COPY --chown=ubuntu:ubuntu config/vimrc /home/ubuntu/.vimrc

USER ubuntu
WORKDIR /home/ubuntu/scripts

CMD ["sleep", "infinity"]
