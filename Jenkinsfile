pipeline {
    agent { node { label 'Agent-1' } }
    environment {
        packageVersion = '' // Initialize the packageVersion variable
    }
    stages {
        stage('Deploy') {
            steps {
                script {
                    echo "Deploy"
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
