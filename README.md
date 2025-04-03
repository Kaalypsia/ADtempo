# ADtempo

La ligne Powershell à taper pour obtenir vos scripts sur votre Windows Serveur (2022 et+) :

```powershell
Invoke-WebRequest -Uri "https://github.com/Kaalypsia/ADtempo.git" -OutFile "$env:USERPROFILE\Downloads\main.zip"
```

Extraction des fichiers manuelle vers le dossier que vous créez pour l'occasion : C:\Scripts.

Pour lancer le 1er script :
```powershell
powershell -ExecutionPolicy Bypass -File "C:\Scripts\ADtempo-main\CONFIG_Machine.ps1"
```

Réitérer le manipulation pour les scripts suivant dans cet :
1/ CONFIG,
2/INSTALL ADDS
```powershell
powershell -ExecutionPolicy Bypass -File "C:\Scripts\ADtempo-main\INSTALL_ADDS.ps1"
```
3/ IMPORT_Users
```powershell
powershell -ExecutionPolicy Bypass -File "C:\Scripts\ADtempo-main\IMPORT_Users.ps1"
```

(Configuration entièrement testée et approuvée sur VM Windows Server 2022)