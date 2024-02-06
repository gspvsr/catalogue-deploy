pipeline {
    agent { node { label 'Agent-1' } }
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

        stage ('Init'){
            steps{
                sh """
                cd terraform
                terraform init -reconfigure
                """
            }
        }
    
        stage ('plan'){
            steps{}
                sh """
                cd terraform
                terraform plan
                """
        }

    post {
        always {
            echo 'cleaning up workspace'
            deleteDir()
        }
    }
}
