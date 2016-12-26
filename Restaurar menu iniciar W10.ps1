# TI - Masters
# Script Criado por João Átila Melo

# Correção do Menu iniciar via Powershell

Get-AppXPackage -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}

#Caso ocorra falhas durante esse procedimento, pode-se dar pelo fato de um processo já existir ou a versão do Visual C++ estiver mais atual que a versão do repositório do powershell

# Aguardar a finalização do processo
# ....#.....#.....#.....## ....#.....#.....#.....## ....#.....#.....#.....## ....#.....#.....#.....## ....#.....#.....#.....#
# Executa a correção do shellexperience

Get-appxpackage -all shellexperience -packagetype bundle |% {add-appxpackage -register -disabledevelopmentmode ($_.installlocation + “C:\Program Files\WindowsApps\Microsoft.Windows.ShellExperienceHost_1.0.0.2_neutral_ShellExperienceHost.laac0539cc_8wekyb3d8bbwe\AppxManifest.xml”)}

#Executa o CMD

cmd.exe

# restarta a maquina assim que finaliza o processo

shutdown -r -t 0

# Fim do procedimento.
