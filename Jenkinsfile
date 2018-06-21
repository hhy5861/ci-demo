env.PROJ_NAME='ci-demo'
env.PROJ_DIR="src/github.com/hhy5861/${PROJ_NAME}"
env.PROJ_BUILD_NAME="${PROJ_NAME}-86-x64-linux"
env.WEB_WORK="/data/web/${PROJ_NAME}"

env.GIT_URL="git@github.com:hhy5861/ci-demo.git"
node('demo') {
    withEnv(["GOPATH=$WORKSPACE"]) {
        stage('init') {
            sh '''
                mkdir -p $GOPATH/{bin,pkg,src}
            '''
        }

        stage('scm') {
            checkout([
                $class: 'GitSCM',
                branches: [[name: '*/demo']],
                doGenerateSubmoduleConfigurations: false,
                extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: "${PROJ_DIR}"]],
                submoduleCfg: [],
                userRemoteConfigs: [[
                    credentialsId: '670152fe-b26f-450a-aa2c-eba2312e1f60',
                    url: "${GIT_URL}"
                ]]
            ])
        }

        stage('build') {
            sh '''
                echo 'build golang ok'
            '''
        }

        stage('deploy demo') {
            sh '''
                echo "demo-1 ok!!!!"
                echo 'deploy demo ok'
            '''
        }
    }
}