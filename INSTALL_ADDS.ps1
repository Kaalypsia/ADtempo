# Script d'installation d'Active Directory Domain Services (ADDS)

# Installer ADDS
Install-WindowsFeature AD-Domain-Services

# Promouvoir le serveur en contrôleur de domaine
$domainName = "MonBuisson"
$ouUsers = "users"
$ouIT = "IT"
$ouExtern = "extern"

# Créer la forêt et le domaine
Install-ADDSForest -DomainName $domainName -DomainNetbiosName "MONBUISSON" -ForestMode Win2022 -DomainMode Win2022 -SafeModeAdministratorPassword (ConvertTo-SecureString -AsPlainText "VotreMotDePasseSécurisé" -Force)

# Créer les OUs
New-ADOrganizationalUnit -Name $ouBuissounet -Path "DC=MonBuisson,DC=com"
New-ADOrganizationalUnit -Name $ouUsers -Path "OU=Buissounet,DC=MonBuisson,DC=com"
New-ADOrganizationalUnit -Name $ouIT -Path "OU=Buissounet,DC=MonBuisson,DC=com"
New-ADOrganizationalUnit -Name $ouExtern -Path "OU=Buissounet,DC=MonBuisson,DC=com"

# Installer le rôle DNS
Install-WindowsFeature DNS

# Installer RSAT (Remote Server Administration Tools)
# Install-WindowsFeature RSAT

# Installation de tools indispensables (dont RSAT)
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

# Vérification de l'installation
if (Get-WindowsFeature AD-Domain-Services | Where-Object {$_.Installed -eq $true}) {
    Write-Host "ADDS a été installé avec succès."
} else {
    Write-Host "L'installation d'ADDS a échoué."
}
