pipeline {
    agent any

    stages {
        stage ('Test 3: Master') {
            when { branch 'master' }
            steps {
                echo 'I only execute on the master branch.'
            }
        }

        stage ('Test 3: Develop') {
            when { branch 'develop' }
            steps {
                echo 'I only execute on the develop branch.'
            }
        }

        stage ('Test 3: Demo') {
            when {  branch 'demo' } 
            steps {
                echo 'I only execute on the demo branch.'
            }
        }

        stage ('Test 3: Demo-1') {
            when {  branch 'demo-1' } 
            steps {
                node('demo'){
                    echo 'I only execute on the demo-1 branch.'
                }
            }
        }
    }
}