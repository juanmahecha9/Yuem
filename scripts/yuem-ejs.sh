#!/bin/bash
set -fueo pipefail

#Version de codigo YUEM V2.15
#Uso de funciones para organizar creador de proyecto

function main(){
    crearCarpeta
    nodeInit
    
    crearEsqueletoProyecto
    codeIndexJS
    codeIndexHTML
    
    rutaInicial
    controllers
    
    #Llamar Helpers
    sh ../helpers/helpers.sh
    
    pwd
    echo "...🆂🆄🅲🅲🅴🆂🆂❗"
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
   | |   | |_| | | |___  | |  | |
   |_|    \___/  |_____| |_|  |_|

    _
  _| |_
 |_   _|
   |_|

  _____       _   ____
 | ____|     | | / ___|
 |  _|    _  | | \___ \
 | |___  | |_| |  ___) |
 |_____|  \___/  |____/

    "
    # Dealy de carga
    sleep 1
}

function nodeInit(){
    cd $projectName
    #Creación de Node.js
    npm init -y
    npm i express morgan path cors nodemailer ejs
    npm i -D nodemon
    #instalación de babel para uso de la ultima version de ecmascript 7
    npm install --save-dev @babel/core @babel/cli @babel/preset-env @babel/polyfill babel-loader
    npm i @babel/node
    #modulo para eliminar la carpeta dist si existe 
    npm i rimraf
    #revisión de seguridad del conjunto de dependencias de tu proyecto
    npm audit
}



function crearEsqueletoProyecto(){(
        mkdir src
        cd src
        mkdir views public private helpers routes database doc controllers
)}

function codeIndexJS(){(
        #Crear archivo de configuración index.js dentro de la carpeta principal del proyecto
        cd src
        touch index.js
        #Agregar codigo al archivo index
        tee -a index.js << EOF
// Configuración rapida de proyecto Node.js by juanmahecha9
import express from "express";
import morgan from "morgan";
import path from "path";
import bodyParser  from "body-parser";

const router = require("./routes/routes.js");

const app = express();

app.set("port", process.env.PORT || 4000);

// concatenar el directorio de las vistas de motores de plantillas
app.set('views', path.join(__dirname, '/views'));
app.use(express.static(path.join(__dirname, "/public")));
app.use(express.urlencoded({ extended: false }));
app.set("view engine", "ejs");

app.use(morgan("dev"));


app.use(router);

app.listen(app.get("port"), () => {
  console.log("server running at http://localhost:" + app.get("port"));
});
EOF
        pwd #Ruta carpeta principal del proyecto
)}

function codeIndexHTML(){(
        #Crear archivos HTML
        cd src/views
        touch index.ejs
        #Agregar codigo al archivo index
    tee -a index.ejs << EOF
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
    <title><%= title %></title>
</head>

<body>
    <!-- Archivo de inicio -->
    <div id="logo-brackets">
        <div class="square">
            <img class="img" src="images/yuem.jpg" alt="YUEM">
        </div>
       <%- include('partials/url')  %>
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
        mkdir partials
        cd partials
        touch url.ejs
        tee -a url.ejs << EOF1
<b><a class="github" href="https://github.com/juanmahecha9" target="_blank"><%= url %></a></b>
EOF1
)}



#Creación de las rutas iniciales
function rutaInicial(){(
        cd src/routes
        touch routes.js
        tee -a routes.js << EOF
//Configuración de las rutas
import express from "express";

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
        title: 'yuem-ejs',
        url: 'Juanmahecha9'
    })
}

//Exportar
module.exports = indexCtrl;
EOF
)}

#Invocar funcion principal
main