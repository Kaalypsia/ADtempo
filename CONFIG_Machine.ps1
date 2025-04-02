# Script de configuration de la machine virtuelle

# Renommer la machine virtuelle
Rename-Computer -NewName "SRV-ADDS" -Force

# Configurer l'IP statique
$interface = Get-NetAdapter | Where-Object { $_.Status -eq 'Up' }

# Définir une IP statique
New-NetIPAddress -InterfaceAlias $interface.Name -IPAddress 192.168.1.140 -PrefixLength 24 -DefaultGateway 192.168.1.1

# Configurer le DNS
Set-DnsClientServerAddress -InterfaceAlias $interface.Name -ServerAddresses 1.1.1.1

# Vérifier la configuration
$ipConfig = Get-NetIPAddress -InterfaceAlias $interface.Name
$dnsConfig = Get-DnsClientServerAddress -InterfaceAlias $interface.Name

if ($ipConfig.IPAddress -eq "192.168.1.140" -and $dnsConfig.ServerAddresses -contains "1.1.1.1") {
    Write-Host "La configuration réseau a été correctement effectuée."
} else {
    Write-Host "Il y a eu un problème avec la configuration réseau."
}
