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
        stage('Init') {
            steps {
                sh """
                 cd terraform
                 terraform init
                """
            }
        }
        stage('Plan') {
            steps {
                sh """
                 cd terraform
                 terraform plan -var="app_version=${params.version}"
                """
            }
        } 
        
        stage('Input') {
        steps {
            input {
                message "Should we continue?"
                ok "Yes, we should."
                submitter "alice,bob"
                parameters {
                    string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
                }
            }
        }
    }

        
        stage('Apply') {
            steps {
                sh """
                 cd terraform
                 terraform apply -var="app_version=${params.version}" -auto-approve
                """
            }
        } 
    }
        
    post {
        always {
            echo 'Cleaning up workspace'
            //deleteDir()
        }
    }
}
