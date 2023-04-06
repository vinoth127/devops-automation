pipeline {
    agent any
    environment {
        VERSION = 'v5.29.1'
        BUILD_NUMBER="${env.BUILD_ID}-${env.GIT_BRANCH.replaceAll('origin/','')}"
        IMAGE_TAG = '$VERSION-b$BUILD_NUMBER'
    }
    stages {
        stage('Test') {
            steps {
                script {
                    echo "Test Steps Goes Here...."
                }
            }
        }
        stage('Build') {
            steps {
                dir("") {
                    script {
                        sh "mvn clean -DskipTests package"
                        sh "docker build -t ${env.IMAGE_TAG} ."
                    }

                }
            }
        }
        stage('Push To Registry') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u vinoth -p ${dockerhubpwd}'
                    echo "Creating Image with Tag $IMAGE_TAG"
                    sh "docker push $IMAGE_TAG"
                }
            }
        }
    }
    post {
        always {
            sh "docker rmi ${env.IMAGE_TAG} | true"
            sh "docker system prune --volumes -f | true"
            sh "docker logout | true"
        }
    }
