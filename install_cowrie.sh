#!/bin/bash

# Dieses Skript installiert und konfiguriert Cowrie auf einem Raspberry Pi

echo "Aktualisiere System..."
sudo apt update && sudo apt upgrade -y

echo "Installiere benötigte Abhängigkeiten..."
sudo apt install git python3 python3-pip python3-virtualenv libssl-dev libffi-dev build-essential -y

echo "Klonen des Cowrie-Repositories..."
cd /opt
sudo git clone https://github.com/cowrie/cowrie.git
cd cowrie

echo "Erstellen der virtuellen Umgebung..."
python3 -m venv cowrie-env

echo "Aktivieren der virtuellen Umgebung und Installieren der Python-Abhängigkeiten..."
source cowrie-env/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
deactivate

echo "Kopieren der Standardkonfiguration..."
cp cowrie.cfg.dist cowrie.cfg

echo "Optional: Konfiguration anpassen (Port, Log-Verzeichnis etc.)"
# Hier kannst du weitere Anpassungen vornehmen, z.B.:
# sed -i 's/^#hostname = .*/hostname = myhoneypot/' cowrie.cfg
# oder andere Einstellungen nach Bedarf.

echo "Erstellen eines Systemd-Dienstes für Cowrie..."

sudo bash -c 'cat > /etc/systemd/system/cowrie.service <<EOF
[Unit]
Description=Cowrie SSH Honeypot
After=network.target

[Service]
Type=simple
User=$USER
WorkingDirectory=/opt/cowrie
ExecStart=/bin/bash -c "source /opt/cowrie/cowrie-env/bin/activate && /opt/cowrie/bin/cowrie start"
ExecStop=/bin/bash -c "/opt/cowrie/bin/cowrie stop"
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF'

echo "Aktiviere und starte den Cowrie-Dienst..."
sudo systemctl daemon-reload
sudo systemctl enable cowrie.service
sudo systemctl start cowrie.service

echo "Installation abgeschlossen!"
echo "Logs findest du unter /opt/cowrite/log/"
