YUEM by Juanmahecha9

  
## ¿Que es?

Yuem es un proyecto que se enfoca en generar un proyecto generico de Node.js, en donde su principal objetico es la optimizacion de tiempo para la creacion de pequeños proyectos, utilizando las ultimas versiones de ecmascript 6 con la ayuda de babel, el cual es un transcompilador de JavaScript gratuito y de código abierto que se utiliza principalmente para convertir el código ECMAScript 2015+ en una versión de JavaScript compatible con versiones anteriores que pueden ejecutar los motores JavaScript más antiguos.

El proyecto genera la opcion de creación de frontend usando motores de plantillas como lo son pug, hanblebars y ejs al igual que HTM5 puro y un backend de node.js.

## ¿Cómo ejecutar?
  

Para sistemas Linux o MacOs, antes de ejecutar usar el comando `sh yuem.sh` se debe de ejecutar `chmod +x permisos.sh`,el cual da el permiso de ejecución para el archivo de permisos; seguido ejecutar el comando `sh permisos.sh` donde se le darán los permisos necesarios para los archivos de ejecución del proyecto,

Al otorgar los permisos a los archivos, desde la terminal usar el comando `sh yuem.sh` ó `./yuem.sh`, si se requiere ver que es lo que sucede internamente del programa durante la ejecución del programa usar el comando `sh -vx ./yuem.sh`, seguido seleccionar el tipo de engine template a usar y darle nombre al proyecto.

  

## Ejecución del programa node.js
  

La ejecución del programa se ejecuta con los siguientes comandos:

1. Enrutamiento a la carpeta del proyecto: `cd Nombre_asiganado_a_la_carpeta`.

2. Ejecución del servidor; para esto se puede usar uno de los siguientes comandos:
- `npm run start`, comando con el cual se ejecuta el ambiente de pruebas con el uso de nodemon, paquete que monitorea los cambios en el código fuente que se esta desarrollando y automáticamente re inicia el servidor.
- `npm run serve`, comando que ejecuta el ambiente de pruebas.
- `npm run build, comando que ejecuta la transpilación del proyecto a el lenguaje de javascript actual, manteniendo el servicio moderno.
- `npm run clean`, cmando que permite eleminar la carpeta dist actual, para reemplazar por la nueva generada por el comando actual.


### Video de explicación
En el siguiente video se encuentra la explica de como crear un proyecto de este tipo desde ceros:
https://youtu.be/0PRlBksqK_w



npm i webpack webpack-cli html-webpack-plugin handlebars-loader image-webpack-loader css-loader mini-css-extract-plugin sass-loader node-sass autoprefixer postcss-loader file-loader webpack-dev-server