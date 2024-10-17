pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'tetrisant_image:latest'
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo 'Checking out code...'
                checkout scm // This checks out your repository code
            }
        }

        stage('Set up Docker Buildx') {
            steps {
                echo 'Setting up Docker Buildx...'
                // This is assumed, if you need custom Docker Buildx setup, you can add more steps
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image: ${DOCKER_IMAGE}..."
                sh '''
                    echo "Checking files in current directory:"
                    ls -l
                    docker build -t ${DOCKER_IMAGE} .
                '''
            }
        }

        stage('Upload Tetris.jar') {
            steps {
                echo 'Uploading Tetris.jar...'
                archiveArtifacts artifacts: 'dist/Tetris.jar', allowEmptyArchive: true
            }
        }
    }
    
    post {
        always {
            echo 'Cleaning up...'
            cleanWs() // Clean up the workspace after the build
        }
    }
}
