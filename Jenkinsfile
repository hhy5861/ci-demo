#!/usr/bin/env groovy

// Jenkinsfile (Scripted Pipeline)
node('demo') {
    env.SERVICE_NAME = "ci-demo"
    try {
        checkout scm

        stage("环境变量") {
            sh 'printenv'
        }

        stage("检出代码") {
            checkout scm
        }

        stage('镜像构建') {
            sh '''
                echo 'build'
            '''
        }

        stage('部署') {
            sh '''
                echo 'deploy'
            '''
        }
    } catch (e) {
        print(e.toString())
        currentBuild.result = "FAILURE"
        env.OK="false"
    } finally {
        sh '''
            echo 'notify'
        '''
    }
}