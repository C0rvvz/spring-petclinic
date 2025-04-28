pipeline {
  agent none
  stages {
    stage('Maven Install') {
      agent {
        docker {
          image 'maven:3.9.6-eclipse-temurin-17'  # Maven + Java 17
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
  }
}