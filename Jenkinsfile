stage ('Test 3: Master') {
    when { branch 'master' }
    steps { 
        echo 'I only execute on the master branch.' 
    }
}

stage ('Test 3: Dev') {
    when { not { branch 'master' } }
    steps {
        echo 'I execute on non-master branches.'
    }
}