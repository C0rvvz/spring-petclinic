pipeline {
    agent any  // Usa un agente global para consistencia
    
    stages {
        stage('Maven Install') {
            agent {
                docker {
                    image 'maven:3.9.6'
                    reuseNode true  // Comparte el workspace con la siguiente etapa
                }
            }
            steps {
                sh 'mvn clean install'  // Corregido "mwn" -> "mvn"
            }
        }
        
        stage('Docker Build') {
            steps {
                script {
                    // Verifica que el Dockerfile exista
                    if (!fileExists('Dockerfile')) {
                        error("Dockerfile no encontrado en: ${pwd()}")
                    }
                    sh 'ls -la && docker build -t c0rvvz/spring-petclinic:latest .'
                }
            }
        }
    }
}