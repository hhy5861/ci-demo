#!/usr/bin/env groovy

pipeline {
    stages {
        switch (env.BRANCH_NAME) {  
            case 'master': 
                sh '''
                    echo 'master'
                '''
                break  
            case 'demo':  
                sh '''
                    echo 'demo'
                '''
                break  
            case 'test':  
                sh '''
                    echo 'test'
                '''  
                break  
            default:  
                sh '''
                    echo "${BRANCH_NAME}"
                ''' 
                break  
        }
    } 
}

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