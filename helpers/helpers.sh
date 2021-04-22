#!/bin/bash

#Aquí se colocan archivos de configuracion que pueden repetirse en todos los scripts

function main(){
    #Crear archivo CSS
    CodeIndexCSS
    
    imagesDownload
    gitignore
}

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

#Llamar la función main
main