# Script d'installation d'Active Directory Domain Services (ADDS)

# Installer ADDS
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

# Promouvoir le serveur en contrôleur de domaine
$domainName = "MonBuisson.com"
$ouUsers = "users"
$ouIT = "IT"
$ouExtern = "extern"

# Créer la forêt et le domaine
Install-ADDSForest -DomainName $domainName
    -DomainNetbiosName "MONBUISSON.com"
 #   -ForestMode Win2022
 #   -DomainMode Win2022
    -SafeModeAdministratorPassword (ConvertTo-SecureString -AsPlainText "mdp123!" -Force)

# Créer les OUs
New-ADOrganizationalUnit -Name $ouBuissounet -Path "DC=MonBuisson,DC=com"
New-ADOrganizationalUnit -Name $ouUsers -Path "OU=Buissounet,DC=MonBuisson,DC=com"
New-ADOrganizationalUnit -Name $ouIT -Path "OU=Buissounet,DC=MonBuisson,DC=com"
New-ADOrganizationalUnit -Name $ouExtern -Path "OU=Buissounet,DC=MonBuisson,DC=com"


# Vérification de l'installation
if (Get-WindowsFeature AD-Domain-Services | Where-Object {$_.Installed -eq $true}) {
    Write-Host "ADDS a été installé avec succès."
} else {
    Write-Host "L'installation d'ADDS a échoué."
}
