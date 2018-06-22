pipeline {
    agent any

    stages {
        stage ('Master') {
            when { branch 'master' }
            steps {
                node('master') {
                    echo 'I only execute on the master branch.'
                }
            }
        }

        stage ('develop') {
            when {  branch 'develop' } 
            node('develop') {
                echo 'I only execute on the develop branch.'
            }
        }
    }
}