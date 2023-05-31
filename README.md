TrafficTool   - Manual de Usuario

 




índice:

-	Guía de instalación
o	Prerrequisitos
o	Acceder al repositorio y descargar paquete de recursos 
o	Abrir paquete en IDE
o	Configuraciones adicionales
	Creación Base de Datos
o	Despliegue

-	Manual de operaciones
o	Acceso a la plataforma
	Creación y registro de usuarios
o	Creación de reportes
o	Visualización de Reportes
o	Gestión de usuarios y reportes (sudo)
















Guía de Instalación


Prerrequisitos

Debido a que este es un programa que se encuentra en desarrollo activo, la versión que se utilizara en esta guía es un Alpha del proyecto, adicionalmente como no contamos con un DNS ni con un servidor dedicado a hostear el sitio web y sus funcionalidades, nos vemos en la necesidad de utilizar herramientas de desarrollo como un IDE para poder ejecutar este proyecto de manera adecuada.
Inicialmente es necesario instalar un JDK, en este caso es necesario instalar la versión 8 del JDK de java, release 91, que se puede encontrar aquí, instrucciones para su instalación se pueden encontrar aquí.
Adicionalmente, como se mencionó previamente es necesario un ambiente de desarrollo integrado, en este caso preferimos NetBeans, en particular en su versión 8.1 Enterprise Edition, que se puede descargar aquí. 
Finalmente necesitamos el framework del servidor que vamos a utilizar, en este caso Glassfish 4.1, que se puede encontrar aquí.


Acceder al repositorio y descargar paquete de recursos 

Para descargar la versión Alpha de este aplicativo se debe acceder a este repositorio alojado en la plataforma GitHub y descargar el archivo 1.0.zip: 
 

![image](https://github.com/FrodoSynthesis05/TrafficTool/assets/72288240/1c9bd3f2-20e6-420d-81ff-1b8bb1d68db9)

Abrir paquete en IDE

Una vez se tenga descargado el archivo .zip y tengamos el NetBeans y JDK adecuadamente configurados de acuerdo con las instrucciones, debemos abrir NetBeans y seguir la siguiente ruta: File -> Import Project -> Import from ZIP. Esto generara un dialogo: 
![image](https://github.com/FrodoSynthesis05/TrafficTool/assets/72288240/cdf142a7-9d7f-419c-a1a6-1ff0983a2fc9)


En la opcion ZIP File, al dar click en Browse, debemos navegar hasta encontrar el archivo 1.0.zip que descargamos previamente, una vez se haya localizado se debe seleccionar y presionar Open.
En la opcion Folder, al dar click Browse, se debe seleccionar la carpeta donde deseamos guardar el proyecto que estamos importando, esto depende de cada usuario y es preferencia personal.
Una vez se hayan hecho ambos pasos de selección daremos click en Import. Al haber hecho estos pasos de manera correcta, veremos lo siguiente bajo la pestaña Projects:
![image](https://github.com/FrodoSynthesis05/TrafficTool/assets/72288240/a653a461-9824-46ce-8383-0936f9ee679f)

 

Esto nos indica que hemos hecho todos los pasos correctamente hasta el momento y tenemos gran parte del proyecto listo para trabajar y/o ejecutar.

Configuraciones adicionales

Ya tenemos las configuraciones adecuadas para la interfaz de usuario, sin embargo, debemos también crear y configurar un servidor y una base de datos para manejar toda la información que recibe la interfaz. 


Creación Base de Datos

Siga los pasos (imágenes) para la creación de la BD.
![image](https://github.com/FrodoSynthesis05/TrafficTool/assets/72288240/cae81160-24c6-4846-9c41-fd1741896c67)
![image](https://github.com/FrodoSynthesis05/TrafficTool/assets/72288240/dca412f7-bb1f-4e7d-8093-95f186f87266)


BD NAME: “U_TACTICO”
USUARIO: “CUALQUIERA”
PASSWORD: “1234”
![image](https://github.com/FrodoSynthesis05/TrafficTool/assets/72288240/07916fed-d553-4a96-8726-a055d8b3e278)
![image](https://github.com/FrodoSynthesis05/TrafficTool/assets/72288240/307a691e-cf8e-473c-93f8-f91d625b2c75)


Crear pool de conexiones:
![image](https://github.com/FrodoSynthesis05/TrafficTool/assets/72288240/91bd8e8b-4245-4449-b694-3b634915cc62)
![image](https://github.com/FrodoSynthesis05/TrafficTool/assets/72288240/4b7bf55d-e395-49b3-875c-428de6dbad06)
![image](https://github.com/FrodoSynthesis05/TrafficTool/assets/72288240/bf8d2e56-990d-4bfd-b853-3f43a40d2638)





Pool Name: “U_TACTICO_POOL”
Resource Wpe: “java.sql.DataSource”
Database Driver Vendor: “Java DB”

![image](https://github.com/FrodoSynthesis05/TrafficTool/assets/72288240/dc5118f6-596c-4073-816f-612b13090e1d)

Llene los datos: de database y password.


Crear recurso:

![image](https://github.com/FrodoSynthesis05/TrafficTool/assets/72288240/831acd39-90f6-49e1-b725-504c86d21a8f)
![image](https://github.com/FrodoSynthesis05/TrafficTool/assets/72288240/4589f162-37fd-4d1a-8826-df62efcda60b)


JNDI Name: jdbc/U_TACTICODB
Pool Name: U_TACTICO_POOL
![image](https://github.com/FrodoSynthesis05/TrafficTool/assets/72288240/a5142446-b45e-4f9d-91f7-05112b80574c)
![image](https://github.com/FrodoSynthesis05/TrafficTool/assets/72288240/aa80f7f6-6e7c-40a7-b8e0-cb7045392a69)



Ejecuta la siguiente query para la creación de la tabla.
CREATE TABLE Usuario (
cedula INTEGER PRIMARY KEY NOT NULL,
nombre VARCHAR(50) NOT NULL,
contrasena VARCHAR(50) NOT NULL
);





Realice el mismo procedimiento para la otra tabla.

CREATE TABLE Reportes(
reporte_id INTEGER PRIMARY KEY NOT NULL,
causa VARCHAR(50) NOT NULL,
descripcion VARCHAR(100) NOT NULL,
latitud DECIMAL(11, 8),
longitud DECIMAL(11, 8),
tipo_senal VARCHAR(100) NOT NULL,
solucion VARCHAR(100) NOT NULL,
FOREIGN KEY (reporte_id) REFERENCES Usuario(cedula)
);


Despliegue
Una vez tengamos todos los prerrequisitos instalados y correctamente configurados, lo único que resta es correr el proyecto para acceder a la pagina web. El primer paso es inicializar Glassfish; para esto nos dirigimos a Services -> Servers -> GlassFish Server -> (Click derecho) Start:  

![image](https://github.com/FrodoSynthesis05/TrafficTool/assets/72288240/e6e4b5e4-4536-4489-a5fe-2d59e9166963)



Una vez se haya inicializado el servido de forma exitosa, debemos oprimir la tecla F6 en nuestro teclado, que correrá el código del proyecto. Una vez se haya ejecutado el código de forma exitosa y el proyecto este corriendo, veremos esta pagina en Microsoft Edge: 



![image](https://github.com/FrodoSynthesis05/TrafficTool/assets/72288240/9a1a2b96-4c98-4d72-9b83-6802095a9f8c)



 
Al ver esta página sabremos con certeza que nuestro programa esta funcionando adecuadamente y esta listo para ser utilizado bajo los parámetros de despliegue de una versión Alpha.













Manual de operaciones


Acceso a la plataforma

Siguiendo los pasos de la guía de instalación deberíamos estar en el landing page de la plataforma.




Creación y registro de usuarios

En nuestra ejecución normal del programa, debemos crear un usuario que nos identifique para hacer uso de todas las funcionalidades de este; podemos hacer esto haciendo clic en el botón “¿No tienes una cuenta? Regístrate aquí.” El cual nos llevara a un formulario que solicita una cedula, un usuario y una contraseña: 
 

![image](https://github.com/FrodoSynthesis05/TrafficTool/assets/72288240/10d16f3f-0856-4db7-81cd-e3ee2b5ebbc9)


Completando este formulario con la información adecuada creara un usuario nuevo dentro de la base de datos. Con esta certeza podemos volver al formulario inicial, en el que podremos iniciar sesión, y al hacerlo veremos nuestra página de inicio:
 

![image](https://github.com/FrodoSynthesis05/TrafficTool/assets/72288240/3f22a252-37e4-4c1a-9f65-908bad9243c7)










Creación de reportes
Haciendo clic en la primera opción de esta lista veremos la siguiente pagina: 
 
 
 ![image](https://github.com/FrodoSynthesis05/TrafficTool/assets/72288240/c9262707-92cf-4811-8478-8effc84f99b5)


Este formulario recoge la información del reporte del incidente, preguntando cual fue la causa de este y solicitando una breve descripción. Adicionalmente debemos ingresar la latitud y longitud del lugar con la finalidad de poder ubicar el siniestro. Finalmente pregunta si había algún tipo de señalización, a lo que se debe responder Si o No, y en caso de que la respuesta sea Si se solicita escribir el tipo de señalización presente en el lugar. 
Una vez se diligencia este reporte y se le da Submit, veremos una confirmación informando que este proceso se completo satisfactoriamente: 
 




![image](https://github.com/FrodoSynthesis05/TrafficTool/assets/72288240/71ace12d-4f36-4aae-a85d-a448c686e220)











Visualización de Reportes

Al hacer clic en la opción Ver Reportes creados, el sistema nos presenta con una lista integral de la información que se incluyo en cada uno, junto con su identificador único: 
 



![image](https://github.com/FrodoSynthesis05/TrafficTool/assets/72288240/98fdff85-5064-41fc-a172-8aef5e048f84)








Gestión de usuarios y reportes (sudo)

Una vez se haya acumulado la cantidad deseada de reportes, el usuario podrá acceder a la sección de gestionar usuarios y reportes, al hacer esto sin embargo el sistema solicitará credenciales de administrador: 
 
 
 ![image](https://github.com/FrodoSynthesis05/TrafficTool/assets/72288240/994345e9-5071-442f-a0b2-143a852b7e4c)



Esto se hace con la finalidad de garantizar la información en la integridad de nuestros sistemas.
Una vez el usuario haya digitado las credenciales correctas se le presentará con la siguiente interfaz:
 
 
 ![image](https://github.com/FrodoSynthesis05/TrafficTool/assets/72288240/3c253629-3d69-43fe-835f-f00b191217c6)




Donde el usuario podrá decidir si desea gestionar usuarios o sí desea gestionar reportes, en caso de que se dé clic a la opción gestionar usuarios se le redirigirá al siguiente formulario que permite hacer varios cambios: 
 


![image](https://github.com/FrodoSynthesis05/TrafficTool/assets/72288240/8049b59a-e6c9-4a97-a288-e300b896d08d)












Esa interfaz le permite al usuario administrador agregar o editar usuarios ya existentes, eliminar usuarios de la base de datos o buscar la información del usuario por medio de su cédula. Si el usuario decide, sin embargo, hacer clic en la opción gestionar reportes se le dirigirá a la siguiente interfaz:  

![image](https://github.com/FrodoSynthesis05/TrafficTool/assets/72288240/de42ad21-583e-47d0-bd0b-a99ea4b2ed23)




Donde una vez más se le presenta al usuario una lista integral de todos los reportes existentes dentro del sistema, y adicionalmente se le presenta una opción de adjuntar una solución. 
 
 
 ![image](https://github.com/FrodoSynthesis05/TrafficTool/assets/72288240/21db1628-0b92-4016-bdf9-b06126ea98b6)



Desde esta pantalla el usuario podrá seleccionar una solución sugerida al reporte, y podrá modificar de este modo los registros del reporte en la base de datos ya sea reporte a reporte o en masa haciendo varias modificaciones en una sola acción.
