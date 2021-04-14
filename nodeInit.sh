#!/bin/bash
set -fueo pipefail
#!/bin/bash
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
sleep 5

cd $projectName
npm init -y
npm i express morgan path cors nodemailer && npm i -D nodemon
npm audit
mkdir scr
cd scr
mkdir views public private helpers routes
cd ..

#Crear archivo de configuración index.js dentro de la carpeta principal del proyecto
touch index.js && echo " // Configuración rapida de proyecto Node.js by juanmahecha9
const express = require('express');
const morgan = require('morgan');
const path = require('path');

const app = express();

app.set('port', process.env.PORT || 4000);

app.use(express.static(path.join(__dirname, 'src/views')));
app.use(express.urlencoded({ extended: false }));

app.use(morgan('dev'));
app.listen(app.get('port'),()=>{
console.log('server running at http://localhost:'+app.get('port'));
})" > index.js

#Crear archivos HTML y CSS del proyecto
cd scr/views && touch index.html && echo "
<!DOCTYPE html>
<html lang='en'>

<head>
    <meta charset='UTF-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <link rel='stylesheet' href='./public/index.css'>
    <!-- Bootstrap styles -->
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css' rel='stylesheet'
        integrity='sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6' crossorigin='anonymous'>
    <title>yuem</title>
</head>

<body>

<!-- Archivo de inicio -->
<p>iniciando</p>

</body>
<!-- Boostrap js -->
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js'
    integrity='sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf'
    crossorigin='anonymous'></script>
<script src='https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js'
    integrity='sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG'
    crossorigin='anonymous'></script>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js'
    integrity='sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc'
    crossorigin='anonymous'></script>

</html>
" >index.html
cd .. && cd public && touch index.css
cd ..
cd ..
#Devolver a la carpeta principal del proyecto

#crear archivo GITIGNORE, para evitar que al crear u repositorio se suban archivos como los modulos de node
touch .gitignore
echo " .DS_STORE
.idea/
modules/.settings
modules/.vscode
node_modules
# Ignore .history for the xyz.local-history VSCode extension
.history
"
