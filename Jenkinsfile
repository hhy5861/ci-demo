env.PROJ_NAME='ci-demo'
env.PROJ_DIR="src/gopkg.exa.center/blockshine-ex/${PROJ_NAME}"
env.PROJ_BUILD_NAME="${PROJ_NAME}-86-x64-linux"
env.WEB_WORK="/data/web/${PROJ_NAME}"

env.GIT_URL="git@gitee.com:blockshine-ex/ci-demo.git"
node('develop') {
    withEnv(["GOPATH=$WORKSPACE"]) {
        stage('init') {
            sh '''
                mkdir -p $GOPATH/{bin,pkg,src}
            '''
        }

        stage('scm') {
            checkout([
                $class: 'GitSCM',
                branches: [[name: '*/develop']],
                doGenerateSubmoduleConfigurations: false,
                extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: "${PROJ_DIR}"]],
                submoduleCfg: [],
                userRemoteConfigs: [[
                    credentialsId: 'b8cf34bb-4342-48bb-8f81-8834112cdcfb',
                    url: "${GIT_URL}"
                ]]
            ])
        }

        stage('build') {
            sh '''
                cd ${PROJ_DIR}
                make clean
                make
            '''
        }

        stage('deploy develop') {
            sh '''
                if [ ! -d "${WEB_WORK}" ]; then
                    mkdir -p ${WEB_WORK}
                fi

                if [ -f "${WEB_WORK}/${PROJ_NAME}" ]; then
                    rm -rf ${WEB_WORK}/${PROJ_NAME}
                fi

                mv -f ${PROJ_DIR}/${PROJ_BUILD_NAME} ${WEB_WORK}/${PROJ_NAME}

                SERVE_STATUS=$(supervisorctl status "${PROJ_NAME}" | grep 'RUNNING' | awk -F ' ' '{print $2}')
                if [ ! -n "${SERVE_STATUS}" ]; then
                    systemctl reload supervisord
                    supervisorctl start ${PROJ_NAME}
                else
                    supervisorctl restart ${PROJ_NAME}
                fi
            '''
        }
    }
}