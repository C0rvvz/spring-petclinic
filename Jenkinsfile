#!groovy
pipeline {
    agent none              // No define un agente global para todo el pipeline
   stages {     
    stage('Maven Install') {  // Nombre de la etapa
      agent {         
       docker {              // Ejecutar esta etapa en un contenedor Docker
         image 'maven:3.5.0'  // Usar la imagen Docker oficial de Maven (versión 3.5.0)
     }       
  }       
  steps {                 // Lo que se va a hacer en esta etapa
       sh 'mvn clean install'   // Ejecutar el comando Maven para compilar el proyecto
       }
     }
   }
 }