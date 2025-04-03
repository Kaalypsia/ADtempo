# ADtempo

La ligne Powershell à taper pour obtenir vos scripts sur votre Windows Serveur (2022 et+) :

```powershell
Invoke-WebRequest -Uri "https://github.com/Kaalypsia/ADtempo.git" -OutFile "$env:USERPROFILE\Downloads\main.zip"
```

Extraction des fichiers manuelle vers le dossier que vous créez pour l'occasion : C:\Scripts.
Il est préconisé, après chaque script, de vérifier la bonne application des fonctions.

Pour lancer le 1er script :
```powershell
powershell -ExecutionPolicy Bypass -File "C:\Scripts\ADtempo-main\CONFIG_Machine.ps1"
```
Ce premier scrip va :
- Renommer votre machine,
- Fixer son adresse IP et sa DefaultGateway,
- Attribuer une adresse DNS de référence,
- Renommer le périphérique réseau utilisé pour le LAN,
- Activer le Remote Desktop,
- Redémarrage machine pour application des paramètres.

Réitérer le manipulation pour les scripts suivant dans cet ordre :
2/INSTALL ADDS.ps1, 3/ IMPORT_Users.ps1
```powershell
powershell -ExecutionPolicy Bypass -File "C:\Scripts\ADtempo-main\INSTALL_ADDS.ps1"
```

Rôle de ce second script :
- Installer l'ADDS et ses dépendences de management tools,
- Promouvoir le serveur comme contrôleur de domaine,
- Créer la forêt,
- Installer le DNS,
- Créer les OU,

```powershell
powershell -ExecutionPolicy Bypass -File "C:\Scripts\ADtempo-main\IMPORT_Users.ps1"
```

(Configuration entièrement testée et approuvée sur VM Windows Server 2022)