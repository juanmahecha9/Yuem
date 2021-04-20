#!/bin/bash
set -fueo pipefail

#Codigo yuem version 1.0.0
#Uso de funciones para organizar creador de proyecto

function main(){
    crearCarpeta
    nodeInit
    modificarPackageJson
    crearEsqueletoProyecto
    codeIndexJS
    codeIndexHTML
    CodeIndexCSS
    rutaInicial
    controllers
    gitignore
    imagesDownload
    pwd
    echo "...SUCCESS!"
}

function crearCarpeta(){
    # Ingreso del nombre del proyecto
    echo 'Project Name:'
    read projectName
    mkdir $projectName
    
    echo "
 EXECUTING:
 __   __  _   _   _____   __  __
 \ \ / / | | | | | ____| |  \/  |
  \ V /  | | | | |  _|   | |\/| |
   | |   | |_| | | |___  | |  | |  _
   |_|    \___/  |_____| |_|  |_| (_)

    "
    # Dealy de carga
    sleep 1
}

function nodeInit(){
    cd $projectName
    #Creación de Node.js
    npm init -y
    npm i express morgan path cors nodemailer 
    npm i -D nodemon
    npm audit
}

function modificarPackageJson(){
    #modificar archivo package.json
    npm install json
    json --in-place -f package.json -e 'this.scripts={
      "test": "echo \"Error: no test specified\" && exit 1",
      "start": "node index.js",
      "dev" : "nodemon index.js"
    }'
    #Verificar que la ruta esta en la carpeta creada
    pwd
}

function crearEsqueletoProyecto(){(
        mkdir src
        cd src
        mkdir views public private helpers routes database doc controllers
)}

function codeIndexJS(){
    #Crear archivo de configuración index.js dentro de la carpeta principal del proyecto
    touch index.js
    #Agregar codigo al archivo index
        tee -a index.js << EOF
// Configuración rapida de proyecto Node.js by juanmahecha9
const express = require("express");
const morgan = require("morgan");
const path = require("path");

const router = require("./src/routes/routes.js")

const app = express();

app.set("port", process.env.PORT || 4000);

// Load static files
app.use(express.static(path.join(__dirname, "/src/views")));
app.use(express.static(path.join(__dirname, "/src/public")));
app.set('view engine', 'html');

app.use(express.urlencoded({ extended: false }));

app.use(morgan("dev"));
app.use(router);

app.listen(app.get("port"),()=>{
console.log("server running at http://localhost:"+app.get("port"));
})
EOF
    pwd #Ruta carpeta principal del proyecto
}

function codeIndexHTML(){(
        #Crear archivos HTML
        cd src/views
        touch index.html
        #Agregar codigo al archivo index
    tee -a index.html << EOF
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Bootstrap styles -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous" />
    <!-- Our styles -->
    <link rel="stylesheet" href="css/index.css" />
    <!-- icon -->
    <link rel="icon" href="images/yuem-icon.jpg" />
    <title>yuem</title>
</head>

<body>
    <!-- Archivo de inicio -->
    <div id="logo-brackets">
        <div class="square">
            <img class="img" src="images/yuem.jpg" alt="YUEM">
        </div>
        <b><a class="github" href="https://github.com/juanmahecha9" target="_blank">By Juanmahecha9</a></b>
    </div>
    <!-- Fin -->
</body>

<!-- Boostrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
    crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
    integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG"
    crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
    integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc"
    crossorigin="anonymous"></script>

</html>
EOF
)}


function CodeIndexCSS(){(
        cd src/public
        mkdir css
        cd css
        touch index.css
        tee -a index.css << EOF
/* Style CSS INDEX.HTMl By Juanmahecha9 */
@import url("https://fonts.googleapis.com/css2?family=Bad+Script&family=Caveat:wght@700&family=Satisfy&family=Shadows+Into+Light+Two&display=swap");
body {
  text-align: center;
  font-family: "Shadows Into Light Two", cursive;
  background-color: #0e0b16;
}

#logo-brackets {
  width: 450px;
  height: 400px;
  position: relative;
  background: #29abe2;
  border-radius: 15% 15% 20% 20%;
  margin: 3% auto;
  text-align: center;
  border-bottom: 30px solid #105991;
}
.square {
  width: 75%;
  height: 75%;
  margin: 0 auto;
  background: #fff;
  border-radius: 10%;
  position: relative;
  top: 50px;
  animation: zoom 0.8s;
}
.square::after {
  content: "{";
  font-size: 270px;
  font-weight: 800;
  position: absolute;
  left: 30px;
  top: -50px;
  color: #000;
  animation: zoom 2s;
}
.square::before {
  content: "}";
  font-size: 270px;
  font-weight: 800;
  position: absolute;
  right: 30px;
  top: -50px;
  color: #000;
  animation: zoom 2s;
}
.square .img{
  margin-top: 90px;
  border-radius: 40px;
  margin-left: 6.5px;
}
b {
  font-size: 50px;
  position: relative;
  top: 150px;
}
.github{
  color: #e7dfdd;
  text-decoration: none;
}
.github:hover{
  color: #e7dfdd;
  text-decoration: underline;
}
#logo-brackets {
  visibility: hidden;
}
#logo-brackets {
  visibility: visible;
  animation: zoom 1s;
}
@keyframes zoom {
  0% {
    transform: scale(1);
  }
  60% {
    opacity: 0.5;
    transform: scale(2);
  }
  100% {
    transform: scale(1);
  }
}
EOF
)}

#Creación de las rutas iniciales
function rutaInicial(){(
        cd src/routes
        touch routes.js
        tee -a routes.js << EOF
//Configuración de las rutas
const express = require("express");

const router = express.Router();

//importar controllers
const { renderIndex } = require("../controllers/controllers.js")

router.get("/", renderIndex );

module.exports = router;
EOF
)}

#Creacion de los controladores
function controllers(){(
    cd src/controllers
    touch controllers.js
    tee -a controllers.js << EOF
//controllers
const indexCtrl = {};

//Aquí se colocan las funciones que realizan en cada peticion
indexCtrl.renderIndex = (req, res) => {
    res.render('index',{
        title: 'yuem-pug',
        url: 'Juanmahecha9'
    })
}

//Exportar
module.exports = indexCtrl;
EOF
)}

#crear archivo GITIGNORE, para evitar que al crear u repositorio se suban archivos como los modulos de node
function gitignore(){
    touch .gitignore
    echo "
.DS_STORE
.idea/
modules/.settings
modules/.vscode
node_modules
# Ignore .history for the xyz.local-history VSCode extension
.history
    " > .gitignore
}

#Descargar imagen y logo del programa
function imagesDownload(){(
        cd src/public
        mkdir images
        cd images
        curl -O https://res.cloudinary.com/yuem1/image/upload/v1618457947/yuem.jpg
        curl -O https://res.cloudinary.com/yuem1/image/upload/v1618458569/yuem-icon.jpg
)}


#Invocar funcion principal
main