pipeline {
    agent { node { label 'Agent-1' } }
    parameters {
        string(name: 'Version', defaultValue: '1.0.1', description: 'Which Version to Deploy')
    }

    // here i need to configure downstream job. I have to pass package version for deployment
    // This job will wait untill  downstream job is over
    stages {
        stage('Deploy') {
            steps {
                echo "Deploying"
                build job: "../catalogue-deploy", wait: true
                }
            }
        }
    }

    post {
        always {
            echo 'cleaning up workspace'
            deleteDir()
        }
    }
}
