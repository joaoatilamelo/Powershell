# Alterar propriedades de Rede via Poserwhell
#
# Setar rede privada para conexão ativa

Get-NetConnectionProfile | Set-NetConnectionProfile –NetworkCategory Private
