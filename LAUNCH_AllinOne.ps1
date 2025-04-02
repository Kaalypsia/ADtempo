# Script de gestion de l'exécution des scripts

# Fonction pour exécuter un script et vérifier son succès
function Run-ScriptWithValidation {
    param(
        [string]$scriptPath,
        [string]$validationMessage
    )

    # Exécuter le script
    & $scriptPath

    # Vérification du succès de l'opération
    $input = Read-Host "$validationMessage (Tapez 'oui' pour continuer)"
    if ($input -ne 'oui') {
        Write-Host "L'opération a échoué ou vous avez choisi de ne pas continuer."
        exit
    }
}

# Exécuter le script 1 : Configuration de la machine virtuelle
Run-ScriptWithValidation -scriptPath "C:\chemin\vers\script1.ps1" -validationMessage "Vérifiez que la machine virtuelle a été correctement configurée"

# Exécuter le script 2 : Installation d'ADDS
Run-ScriptWithValidation -scriptPath "C:\chemin\vers\script2.ps1" -validationMessage "Vérifiez que l'installation d'ADDS a réussi"

# Exécuter le script 3 : Importation des utilisateurs
Run-ScriptWithValidation -scriptPath "C:\chemin\vers\script3.ps1" -validationMessage "Vérifiez que les utilisateurs ont bien été importés"
