# ADtempo

La ligne Powershell à taper pour obtenir vos scripts sur votre Windows Serveur (2022)

```powershell
Invoke-WebRequest -Uri "https://github.com/Kaalypsia/ADtempo.git" -OutFile "$env:USERPROFILE\Downloads\main.zip"
```

Extraction des fichiers manuelle vers le dossier crée pour l'occasion : C:\Scripts.

Pour lancer le 1er script : (phase de test)
```powershell
powershell -ExecutionPolicy Bypass -File "C:\Scripts\ADtempo-main\CONFIG_Machine.ps1"
```

Réitérer le manipulation pour les scripts suivant : 1/ CONFIG, 2/INSTALL ADDS, 3/ IMPORT_Users