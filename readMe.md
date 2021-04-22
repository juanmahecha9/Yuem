YUEM by Juanmahecha9

  

## ¿Que es?

  

Yuem es un proyecto que se enfoca en generar un proyecto generico de Node.js, en donde se enfoca en la optimizacion de tiempo para la creacion de pequeños proyectos.

El proyecto genera la opcion de creación de frontend usando plantillas como lo son pug, hanblebars y un backend con el uso de node.js

## ¿Cómo ejecutar?
  

Para sistemas Linux o MacOs, antes de ejecutar usar el comando `sh yuem.sh` se debe de ejecutar `chmod +x permisos.sh`,el cual da el permiso de ejecución para el archivo de permisos; seguido ejecutar el comando `sh permisos.sh` donde se le darán los permisos necesarios para los archivos de ejecución del proyecto,

Al otorgar los permisos a los archivos, desde la terminal usar el comando `sh yuem.sh` ó `./yuem.sh`, si se requiere ver que es lo que sucede internamente del programa durante la ejecución del programa usar el comando `sh -vx ./yuem.sh`, seguido seleccionar el tipo de engine template a usar y darle nombre al proyecto.

  

## Ejecución del programa node.js
  

La ejecución del programa se ejecuta con los siguientes comandos:

1. Enrutamiento a la carpeta del proyecto: `cd Nombre_asiganado_a_la_carpeta`.

2. Ejecución del servidor; para esto se puede usar uno de los siguientes comandos:
2.1. `node index` el cual ejecuta el servidor un unica vez.
2.2. `npm start` el cual ejecuta el servidor un unica vez.
2.3. `npm run start`el cual ejecuta el servidor bajo el modulo de nodemon, el cual vigila el sistema de archivos y reinicia automáticamente el proceso.


### Video de explicación
En el siguiente video se encuentra la explica de como crear un proyecto de este tipo desde ceros:
https://youtu.be/0PRlBksqK_w
