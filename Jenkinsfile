pipeline {
    agent any
    environment {  
   VERSION = '1'
   BUILD_NUMBER = "${env.BUILD_ID}-${env.GIT_BRANCH.replaceAll('orgin/','')}"
   IMAGE_TAG = '$VERSION-b$BUILD_NUMBER
   
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
                   sh 'docker push javatechie/tcare'
                }
            }
        }
        
    }
}
