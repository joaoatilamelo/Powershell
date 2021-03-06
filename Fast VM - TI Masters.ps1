# TI - Masters
# Script Criado por João Átila Melo
# Scritp para criar de forma rápida maquinas virtuais
# O Disco C:\ deve ter no minimo 200Gb de espaço livre
# Todos os arquivos ISOS devem estar na pasta C:\ISOS
# Criação de variáveis
$CLI1 = "01-CLI"					# Nome da VM Cliente
$SRV1 = "01-SRV"					# Nome da VM Server
$CRAM = 2GB				                # RAM da VM Cliente
$SRAM = 1GB				                # RAM da VM Master
$CLI1VHD = 40GB				                # Tamanho do Disco Cliente
$SRV1VHD = 80GB				                # Tamanho do Disco Server
$VMLOC = "C:\HyperV"			        	# Local dos arquivos VHDX
$NetworkSwitch1 = "PrivateSwitch1"			# Nome do Switch Virtual
$WNCLIISO = "C:\ISOS\Windows10.iso"			# Windows 10 ISO
$WSRVISO = "C:\ISOS\W2K12R2.iso"	        	# Windows Server 2012 R2 ISO


# Criar a pasta das VMS e do Swicth virtual
MD $VMLOC -ErrorAction SilentlyContinue
$TestSwitch = Get-VMSwitch -Name $NetworkSwitch1 -ErrorAction SilentlyContinue; if ($TestSwitch.Count -EQ 0){New-VMSwitch -Name $NetworkSwitch1 -SwitchType Private}

# Criar Máquinas virtuais
New-VM -Name $CLI1 -Path $VMLOC -MemoryStartupBytes $CRAM -NewVHDPath $VMLOC\$CLI1.vhdx -NewVHDSizeBytes $CLI1VHD -SwitchName $NetworkSwitch1
New-VM -Name $SRV1 -Path $VMLOC -MemoryStartupBytes $SRAM -NewVHDPath $VMLOC\$SRV1.vhdx -NewVHDSizeBytes $SRV1VHD -SwitchName $NetworkSwitch1

# Configurar e iniciar as VM1s
Set-VMDvdDrive -VMName $CLI1 -Path $WNCLIISO
Set-VMDvdDrive -VMName $SRV1 -Path $WSRVISO
Start-VM $SRV1
Start-VM $CLI1
