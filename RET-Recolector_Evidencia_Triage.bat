title RECOLECTOR FORENSIC SYSTEM VOLATIL
@echo off
echo Reporte Forense Evidencia Digital > Reporte.txt
echo ------------- >> Reporte.txt
echo Fecha y Hora: >> Reporte.txt
echo %date%-%time% >> Reporte.txt
echo ------------- >> Reporte.txt
echo Usuario Actual y Usuarios Logueados >> Reporte.txt
whoami >> Reporte.txt
query user >> Reporte.txt
echo ------------- >> Reporte.txt
echo cuentas de usuario >> Reporte.txt
wmic useraccount >> Reporte.txt
echo ------------- >> Reporte.txt
echo conexiones activas >> Reporte.txt
netstat -noa | findstr ESTABLISHED >> Reporte.txt
echo ------------- >> Reporte.txt
echo configuracion de adaptador de red >> Reporte.txt
ipconfig /all >> Reporte.txt
echo ------------- >> Reporte.txt
echo informacion del sistema >> Reporte.txt
systeminfo >> Reporte.txt
echo ------------- >> Reporte.txt
echo procesos Corriendo >> Reporte.txt
tasklist >> Reporte.txt
echo ------------- >> Reporte.txt
echo Recursos Compartidos: >> Reporte.txt
echo ------------- >> Reporte.txt
wmic share >> Reporte.txt
echo ------------- >> Reporte.txt
echo fin del Reporte Volatil >> Reporte.txt

:: modulo para permitir ejecutar el script de las contraseñas wifi en powershell
:: requiere ejecutar CMD con acceso de administrador para su ejecucion
:: El modulo idioma sirve para variar los llamados en ingles / español segun el OS no el teclado
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell" /v ExecutionPolicy /t  REG_SZ /d Unrestricted /f
echo off
echo $idioma = [CultureInfo]::InstalledUICulture  -split " " > passgen.ps1
echo if($idioma -eq "en-US") >> passgen.ps1
echo { >> passgen.ps1
echo $SSIDid =  "SSID name" >> passgen.ps1
echo $kc = "Key content" >> passgen.ps1
echo } else{ >> passgen.ps1
echo $SSIDid = "Nombre de SSID" >> passgen.ps1
echo $kc = "Contenido de la clave"} >> passgen.ps1
echo $output = @() >> passgen.ps1
echo $listSSID = @() >> passgen.ps1
echo #Listar todos los SSID guardados en el equipo >> passgen.ps1
echo $output = netsh.exe wlan show profiles name = "*" ^| Select-String -Pattern "$SSIDid" >> passgen.ps1
echo foreach ($i in $output){ >> passgen.ps1
echo ^try^{^$listSSID ^+= ^($i ^-split ^"^:")[1].Trim() -replace '"^'}catch{} >> passgen.ps1
echo } >> passgen.ps1
echo foreach ($SSID in $listSSID){ >> passgen.ps1
echo $output = netsh.exe wlan show profiles name ="$SSID" key=clear >> passgen.ps1
echo try{ >> passgen.ps1
echo $PwSearchResult = $output ^| Select-String -Pattern "$kc" >> passgen.ps1
echo $PW = ($PwSearchResult -split ":")[1].Trim() >> passgen.ps1
echo }catch{} >> passgen.ps1
echo [pscustomobject] @{ >> passgen.ps1
echo WifiProfileName = $SSID  >> passgen.ps1
echo Password = $PW  >> passgen.ps1
echo ^}  >> passgen.ps1
echo ^}  >> passgen.ps1
echo ------------- >> Reporte.txt
powershell .\passgen.ps1 >> Reporte.txt
del passgen.ps1
:: Se vuelve a Reactivar restriccion de Script por seguridad
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell" /v ExecutionPolicy /t  REG_SZ /d Restricted /f