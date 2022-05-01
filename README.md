# Forensics Tools
Digital Forensics Tool

# Instrucciones de Uso
****************************
Para Descargar la herramienta RET-Recolector_Evidencia_Triage:
* Abrir CMD (inicio escribir CMD)
* Copiar y Pegar el siguiente Codigo en la consola: (esto guardara el Script en nuestro escritorio)
```
powershell (new-object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/NahuelSagardoy/forensics/main/RET-Recolector_Evidencia_Triage.bat', 'Desktop\RET-Recolector_Evidencia_Triage.bat')
```
* Una vez descargado el Script ya puede Ejecutarlo. (La funcion de Adquisicion de contraseñas Wifi del Dispositivo Auditado requiere permisos administrativos, si necesita esta informacion se debe ejecutar el script como administrador)

* Se Generara en escritorio un Archivo con extension TXT llamado Reporte, el cual contendra todos los datos relacionados al Triage base volatil del equipo a periciar.

******************************

# Datos que entrega RET Forensic:
* Fecha y Hora del inicio del reporte
* Cuenta de Usuario logueado en el Sistema
* Cuentas de Usuarios existentes en el Sistema
* Conexiones Establecidas
* Informacion sobre los Adaptadores de red utilizados
* IP del equipo y fecha de adquisicion de la misma por DHCP
* ID de Instalacion de Windows
* Zona Horaria
* Paquetes de actualizacion Instalados (KB)
* Procesos activos
* Recursos Compartidos
* Redes Wifi y sus Contraseñas almacenadas en el equipo


![Image text](https://hefin.net/noticias/wp-content/uploads/2017/10/cropped-Foto-Fondo-Negro-3.png)
