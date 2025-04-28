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
                credentialsId: 'admin',   // El ID que guardaste en Jenkins
                usernameVariable: 'DOCKERHUB_USER', 
                passwordVariable: 'DOCKERHUB_PASS'
            )]) {
                sh "docker tag spring-petclinic:latest ${DOCKERHUB_USER}/spring-petclinic:latest"
                sh "docker login -u ${DOCKERHUB_USER} -p ${DOCKERHUB_PASS}"
                sh "docker push ${DOCKERHUB_USER}/spring-petclinic:latest"
            }
        }
    }
  }
}