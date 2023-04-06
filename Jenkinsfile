pipeline {
    agent any
    environment {  
   VERSION = '1'
   IMAGE_TAG = '$VERSION'
   
    }
        stage('Build'){
            steps{
                script{
                 sh "mvn clean install"
                    sh "docker build -t ${env.IMAGE_TAG} ."
                }
            }
        }
        stage('Push'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                   sh 'docker login -u vinoth -p ${dockerhubpwd}'

}
                   sh 'docker push vinoth/tcare'
                }
            }
        }
        
    }

