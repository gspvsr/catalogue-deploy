pipeline {
    agent { node { label 'Agent-1' } }
    options {
        ansiColor('xterm')
    }
    parameters {
        string(name: 'version', defaultValue: '1.0.1', description: 'Which Version to Deploy')
    }

    stages {
        stage('Deploy') {
            steps {
                echo "Deploying..."
                echo "Version from params: ${params.version}"
            }
        }
    }   
    
    post {
        always {
            echo 'Cleaning up workspace'
            deleteDir()
        }
    }
}
