#!/bin/bash

# === Mise à jour du système ===
echo "🔄 Mise à jour du système..."
sudo apt update && sudo apt upgrade -y

# === Installation de Java (Jenkins nécessite Java 17) ===
echo "☕ Installation d'OpenJDK 17..."
sudo apt install -y openjdk-17-jdk

# === Vérification de la version Java ===
echo "✅ Version de Java installée :"
java -version

# === Ajout de la clé Jenkins et du dépôt ===
echo "📦 Ajout du dépôt Jenkins..."
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/" | \
  sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# === Mise à jour des dépôts ===
sudo apt update

# === Installation de Jenkins ===
echo "🔧 Installation de Jenkins..."
sudo apt install -y jenkins

# === Démarrage et activation de Jenkins au boot ===
echo "🚀 Démarrage de Jenkins..."
sudo systemctl enable jenkins
sudo systemctl start jenkins

# === Vérification de l'état ===
sudo systemctl status jenkins --no-pager

# === Récupération du mot de passe initial ===
echo "🔐 Mot de passe d’administration Jenkins (copiez-le) :"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo "✅ Jenkins est installé. Accédez-y via : http://<votre-ip-ec2>:8080"
