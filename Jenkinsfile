pipeline {
    agent any  // This will run the job on any available agent
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                script {
                    echo "Checking files in current directory:"
                    sh 'ls -l'
                    sh 'sudo docker build -t tetrisant_image:latest .'
                }
            }
        }
        stage('Upload Artifact') {
            steps {
                archiveArtifacts artifacts: 'dist/Tetris.jar'
            }
        }
    }
}
