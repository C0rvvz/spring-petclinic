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
          credentialsId: 'admin',  // Debe coincidir con el ID en Jenkins
          passwordVariable: '2002.juand',
          usernameVariable: 'c0rvvz'
        )]) {
          // Tag y push de la imagen
          sh "docker tag spring-petclinic:latest ${env.dockerHubUser}/spring-petclinic:latest"
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh "docker push ${env.dockerHubUser}/spring-petclinic:latest"
        }
      }
    }
  }
}