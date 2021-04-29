#!/bin/bash
set -fueo pipefail

#Aquí se colocan archivos de configuracion que pueden repetirse en todos los scripts

function main(){
    #modificar archivo package.json
    modificarPackageJson
    
    #Crear archivo de configuracion para uso de babel
    babelFile
    
    #Crear archivo CSS
    CodeIndexCSS
    
    #Archivos de envio de correo
    emailConfigJson
    emailSender
    
    imagesDownload
    gitignore
}

function modificarPackageJson(){(
        #modificar archivo package.json
        npm install json
        json --in-place -f package.json -e 'this.scripts={
      "test": "echo \"Error: no test specified\" && exit 1",
      "build": "babel src -d dist --source-maps --copy-files",
      "serve": "babel-node src/index.js",
      "start": "nodemon src/index.js --exec babel-node",
      "clean": "rimraf dist",

        }'
        #Verificar que la ruta esta en la carpeta creada
    pwd)
}

function babelFile(){(
        touch .babelrc
  tee -a .babelrc << EOF
  {
  "presets": [
    [
      "@babel/env",
      {
        "targets": {
          "edge": "17",
          "firefox": "60",
          "chrome": "67",
          "safari": "11.1"
        }
      }
    ]
  ]
}
EOF
)}

#Crear el archivo CSS, el cual es el mismo en todos los  engine templates
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
  position: relative;
  top: 150px;
}
.github{
  font-size: 50px;
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

#Crear archivo private mail
function emailConfigJson(){(
        cd src/private
        touch emailData.json
  tee -a emailData.json << EOF
  {
    "email": "email",
    "password": "password"
  }
EOF
)}

#Funcion de correo electronico
function emailSender(){(
        cd src/helpers
        touch emailSender.js
  tee -a emailSender.js << EOF
  import nodemailer from "nodemailer";
const config = require("../private/emailData.json");

function emailSend(nombre, correo, texto) {
  let transporter = nodemailer.createTransport({
    service: "gmail",
    auth: {
      user: config.email,
      pass: config.password,
    },
  });

  let mailOptions = {
    from: config.email,
    to: correo,
    subject: "Prueba Nodemailer",
    text: "ASUSNTO",
    html: "TEXTO DE ENVIO"
      ,
  };

  transporter.sendMail(mailOptions, function (error, info) {
    if (error) {
      console.log(error);
    } else {
      console.log("Correo enviado: " + info.response);
    }
  });
}

module.exports = emailSend;
EOF
)}

#Llamar la función main
main