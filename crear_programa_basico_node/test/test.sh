#!/bin/bas

carpeta=MyApp

function main(){
    echo "hola mundo..."
    crearCarpeta
    nodeInit
    archivoPrincipal
    archivoHTML
    archivoCSS
}


#creacion de la carpeta principal
function crearCarpeta(){
    mkdir $carpeta
    cd $carpeta
}


#creacion de no proyecto init node y el esquelto
function nodeInit(){
    npm init -y
    npm install express path
    
    mkdir src
    cd src
    mkdir views public private controllers database helpers doc routes etc
    cd ..
}


# creacion del archivo principal
function archivoPrincipal(){
    touch index.js
    tee -a index.js << EOF
const express = require("express");
const path = require("path");

const app = express();

app.use(express.static(path.join(__dirname, "src/views")));
app.use(express.static(path.join(__dirname, "src/public")));

app.get("/", (req,res)=>{
    res.render(index);
});

app.listen(3000, ()=>{
    console.log("servidor ejecutado en el puerto 3000");
});
EOF
}

function archivoHTML(){(
        cd src/views
        touch index.html
    tee -a index.html << EOF
    <html>
    <link rel="stylesheet" href="css/index.css"/>

    <div>
<h1 class="texto">
HOLA MUNDO...!
</h1>
    </div>

    </html>
EOF
)}

function archivoCSS(){(
        cd src/public
        mkdir css
        cd css
        touch index.css
    tee -a index.css << EOF
.texto{
    color:green;
    text-align: center;
}
EOF
)}

main