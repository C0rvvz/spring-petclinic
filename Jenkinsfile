pipeline {
  agent none
  stages {
    stage('Maven Install') {
      agent {
        docker {
          image 'maven:3.9.6-eclipse-temurin-17'  
          args '-v /home/jenkins/.m2:/root/.m2'
        }
      }
      steps {
        sh 'mvn clean install -DskipTests'
      }
    }
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t c0rvvz/spring-petclinic:latest .'
      }
    }
    stage('Docker Push') {
      agent any
      steps {
        withCredentials([usernamePassword(
          credentialsId: 'admin',  // tu credencial creada
          passwordVariable: 'DOCKER_PASSWORD',
          usernameVariable: 'DOCKER_USERNAME'
        )]) {
          // Tag y push de la imagen
          sh "docker tag spring-petclinic:latest ${DOCKER_USERNAME}/spring-petclinic:latest"
          sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
          sh "docker push ${DOCKER_USERNAME}/spring-petclinic:latest"
        }
      }
    }
  }
}