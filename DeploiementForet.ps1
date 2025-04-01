# Définir les paramètres pour la configuration du contrôleur de domaine
$domainName = "MyForest.com"  # Nom du domaine
$domainNetbios = "MYFOREST"    # Nom NetBIOS du domaine
$safeModePassword = "mdp123!"  # Mot de passe pour le mode de récupération du DSRM

# Vérifier que le serveur est membre d'un groupe Administrateurs
if (-not (Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System")) {
    Write-Host "Vous devez exécuter ce script en tant qu'administrateur." -ForegroundColor Red
    exit
}

# Installation des fonctionnalités AD DS et DNS si elles ne sont pas déjà installées
Install-WindowsFeature -Name AD-Domain-Services, DNS -IncludeManagementTools

# Promouvoir le serveur en tant que contrôleur de domaine
Install-ADDSForest -DomainName $domainName -DomainNetbiosName $domainNetbios `
    -SafeModeAdministratorPassword (ConvertTo-SecureString -String $safeModePassword -AsPlainText -Force) `
    -InstallDNS `
    -Force -Restart

Write-Host "Le serveur est maintenant un contrôleur de domaine dans la forêt $domainName." -ForegroundColor Green
