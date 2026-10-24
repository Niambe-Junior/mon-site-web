#!/bin/bash
set -e

# Mise a jour des listes de paquets
apt-get update
apt-get install -y ca-certificates curl git

# Ajout du depot officiel Docker
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu jammy stable" > /etc/apt/sources.list.d/docker.list

# Installation de Docker
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Autorisation pour l utilisateur vagrant
usermod -aG docker vagrant

echo "=== Docker installe : $(docker --version) ==="