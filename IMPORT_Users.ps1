# Script pour l'importation des utilisateurs à partir d'un fichier CSV

# Charger les utilisateurs depuis le fichier CSV
$csvFile = "C:\chemin\vers\users.csv"  # À personnaliser
$users = Import-Csv -Path $csvFile

# Créer les utilisateurs et les ajouter aux OUs appropriées
$index = 1
foreach ($user in $users) {
    $username = $user.Username
    $password = ConvertTo-SecureString $user.Password -AsPlainText -Force
    $ou = if ($index -le 450) { "users" } elseif ($index -le 470) { "IT" } else { "extern" }

    # Créer l'utilisateur
    New-ADUser -SamAccountName $username -UserPrincipalName "$username@MonBuisson.com" -Name "$($user.Nom) $($user.Prénom)" -GivenName $user.Prénom -Surname $user.Nom -PasswordNeverExpires $true -AccountPassword $password -Enabled $true -Path "OU=$ou,DC=MonBuisson,DC=com"

    # Incrémenter l'index
    $index++
}

Write-Host "Les utilisateurs ont été importés avec succès."
