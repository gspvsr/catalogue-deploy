pipeline {
    agent { node { label 'Agent-1' } }
    parameters {
        string(name: 'version', defaultValue: '1.0.1', description: 'Which Version to Deploy')
    }

    stages {
        stage('Deploy') {
            steps {
                echo "Deploying..."
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
