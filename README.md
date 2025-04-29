# cowrie-honeypot-installation
Cowrie Honeypot Installation

Dieses Repository enthält ein Skript und Anleitungen zur automatischen Installation und Konfiguration des Cowrie SSH-Honeypots auf einem Linux-System.

Inhalt

Automatisierte Installation aller benötigten Abhängigkeiten
Einrichtung von Cowrie
Starten als Systemdienst
Voraussetzungen

Ein Linux-basiertes Betriebssystem (z.B. Ubuntu 20.04 oder höher)
Root- oder sudo-Rechte
Internetverbindung
Nutzung

1. Repository klonen

git clone https://github.com/diggerwf/cowrie-honeypot-installation.git
Copy
2. In das Verzeichnis wechseln

cd cowrie-honeypot-installation
Copy
3. Installationsskript ausführbar machen

chmod +x install_cowrie.sh
Copy
4. Skript ausführen

sudo ./install_cowrie.sh
Copy
Das Skript installiert alle notwendigen Komponenten, richtet Cowrie ein und startet es automatisch.

Hinweise

Das Skript ist für Ubuntu-Systeme optimiert.
Bei Problemen überprüfe die Log-Dateien im logs-Verzeichnis.
Für Updates kannst du das Repository aktualisieren und das Skript erneut ausführen.
Lizenz

Dieses Projekt steht unter der MIT-Lizenz. Siehe LICENSE für Details.

Wenn du möchtest, kann ich dir auch eine Version speziell für dein Projekt anpassen oder zusätzliche Abschnitte hinzufügen!
