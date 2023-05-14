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
 


Abrir paquete en IDE

Una vez se tenga descargado el archivo .zip y tengamos el NetBeans y JDK adecuadamente configurados de acuerdo con las instrucciones, debemos abrir NetBeans y seguir la siguiente ruta: File -> Import Project -> Import from ZIP. Esto generara un dialogo: 

En la opcion ZIP File, al dar click en Browse, debemos navegar hasta encontrar el archivo 1.0.zip que descargamos previamente, una vez se haya localizado se debe seleccionar y presionar Open.
En la opcion Folder, al dar click Browse, se debe seleccionar la carpeta donde deseamos guardar el proyecto que estamos importando, esto depende de cada usuario y es preferencia personal.
Una vez se hayan hecho ambos pasos de selección daremos click en Import. Al haber hecho estos pasos de manera correcta, veremos lo siguiente bajo la pestaña Projects:
 

Esto nos indica que hemos hecho todos los pasos correctamente hasta el momento y tenemos gran parte del proyecto listo para trabajar y/o ejecutar.

Configuraciones adicionales

Ya tenemos las configuraciones adecuadas para la interfaz de usuario, sin embargo, debemos también crear y configurar un servidor y una base de datos para manejar toda la información que recibe la interfaz. 


Creación Base de Datos

//ToDo

Despliegue
Una vez tengamos todos los prerrequisitos instalados y correctamente configurados, lo único que resta es correr el proyecto para acceder a la pagina web. El primer paso es inicializar Glassfish; para esto nos dirigimos a Services -> Servers -> GlassFish Server -> (Click derecho) Start:  


Una vez se haya inicializado el servido de forma exitosa, debemos oprimir la tecla F6 en nuestro teclado, que correrá el código del proyecto. Una vez se haya ejecutado el código de forma exitosa y el proyecto este corriendo, veremos esta pagina en Microsoft Edge: 






 
Al ver esta página sabremos con certeza que nuestro programa esta funcionando adecuadamente y esta listo para ser utilizado bajo los parámetros de despliegue de una versión Alpha.













Manual de operaciones


Acceso a la plataforma

Siguiendo los pasos de la guía de instalación deberíamos estar en el landing page de la plataforma.




Creación y registro de usuarios

En nuestra ejecución normal del programa, debemos crear un usuario que nos identifique para hacer uso de todas las funcionalidades de este; podemos hacer esto haciendo clic en el botón “¿No tienes una cuenta? Regístrate aquí.” El cual nos llevara a un formulario que solicita una cedula, un usuario y una contraseña: 
 



Completando este formulario con la información adecuada creara un usuario nuevo dentro de la base de datos. Con esta certeza podemos volver al formulario inicial, en el que podremos iniciar sesión, y al hacerlo veremos nuestra página de inicio:
 











Creación de reportes
Haciendo clic en la primera opción de esta lista veremos la siguiente pagina: 
 
Este formulario recoge la información del reporte del incidente, preguntando cual fue la causa de este y solicitando una breve descripción. Adicionalmente debemos ingresar la latitud y longitud del lugar con la finalidad de poder ubicar el siniestro. Finalmente pregunta si había algún tipo de señalización, a lo que se debe responder Si o No, y en caso de que la respuesta sea Si se solicita escribir el tipo de señalización presente en el lugar. 
Una vez se diligencia este reporte y se le da Submit, veremos una confirmación informando que este proceso se completo satisfactoriamente: 
 















Visualización de Reportes

Al hacer clic en la opción Ver Reportes creados, el sistema nos presenta con una lista integral de la información que se incluyo en cada uno, junto con su identificador único: 
 











Gestión de usuarios y reportes (sudo)

Una vez se haya acumulado la cantidad deseada de reportes, el usuario podrá acceder a la sección de gestionar usuarios y reportes, al hacer esto sin embargo el sistema solicitará credenciales de administrador: 
 
Esto se hace con la finalidad de garantizar la información en la integridad de nuestros sistemas.
Una vez el usuario haya digitado las credenciales correctas se le presentará con la siguiente interfaz:
 

Donde el usuario podrá decidir si desea gestionar usuarios o sí desea gestionar reportes, en caso de que se dé clic a la opción gestionar usuarios se le redirigirá al siguiente formulario que permite hacer varios cambios: 
 














Esa interfaz le permite al usuario administrador agregar o editar usuarios ya existentes, eliminar usuarios de la base de datos o buscar la información del usuario por medio de su cédula. Si el usuario decide, sin embargo, hacer clic en la opción gestionar reportes se le dirigirá a la siguiente interfaz:  
Donde una vez más se le presenta al usuario una lista integral de todos los reportes existentes dentro del sistema, y adicionalmente se le presenta una opción de adjuntar una solución. 
 
Desde esta pantalla el usuario podrá seleccionar una solución sugerida al reporte, y podrá modificar de este modo los registros del reporte en la base de datos ya sea reporte a reporte o en masa haciendo varias modificaciones en una sola acción.
