pipeline {
    agent any

    options {
        timestamps()
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                echo 'Repository checkout successful'
            }
        }

        stage('Shell Syntax Check') {
            steps {
                sh 'bash -n health_check.sh'
                sh 'bash -n test_health_check.sh'
                echo 'Shell syntax validation passed'
            }
        }

        stage('Automated Tests') {
            steps {
                sh 'chmod +x health_check.sh test_health_check.sh'
                sh './test_health_check.sh'
            }
        }

        stage('Health Check') {
            steps {
                sh './health_check.sh 100 100'
            }
        }
    }

    post {
        success {
            echo 'All DevOps health check stages passed!'
        }
        failure {
            echo 'Pipeline failed. Please check the stage logs.'
        }
    }
}

