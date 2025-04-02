# Script de configuration de la machine virtuelle

# Renommer la machine virtuelle
Rename-Computer -NewName "SRV-ADDS" -Force

# Configurer l'IP statique
$interface = Get-NetAdapter | Where-Object { $_.Status -eq 'Up' }

# Définir une IP statique
New-NetIPAddress -InterfaceAlias $interface.Name -IPAddress 192.168.1.140 -PrefixLength 24 -DefaultGateway 192.168.1.254

# Configurer le DNS
Set-DnsClientServerAddress -InterfaceAlias $interface.Name -ServerAddresses 8.8.8.8

# Vérifier la configuration
$ipConfig = Get-NetIPAddress -InterfaceAlias $interface.Name
$dnsConfig = Get-DnsClientServerAddress -InterfaceAlias $interface.Name

# Renommer périphérique réseau
$AdapterName = (Get-NetAdapter | Select-Object -First 1).Name
Rename-NetAdapter -Name $AdapterName -NewName "LAN"
    Write-Output "Network Adapter renommé avec succès"

if ($ipConfig.IPAddress -eq "192.168.1.140" -and $dnsConfig.ServerAddresses -contains "8.8.8.8") {
    Write-Host "La configuration réseau a été correctement effectuée."
} else {
    Write-Host "Il y a eu un problème avec la configuration réseau."
}

# Activation du RDP
Write-Output "Remote Desktop activation..."
# Mise en route du Remote Desktop
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name fDenyTSConnections -Value 0
# Lancement RDP / Windows Firewall
# Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
# Write-Output "Remote Desktop lancé et règles firewall appliquées."

# Redémarrage pour application
$RestartConfirmation = Read-Host "Do you want to restart the computer to apply the changes? (Answer Y or N)"

# Convert input for case-insensitivity
if ($RestartConfirmation.ToUpper() -eq 'Y') {
    Write-Output "Computer will restart"
    Restart-Computer -Force
} else {
    Write-Output "Changes applied. Please restart the computer manually"
}