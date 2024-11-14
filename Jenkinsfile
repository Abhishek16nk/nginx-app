pipeline {
    agent any  // Use any available agent (Jenkins node)

    environment {
        IMAGE_NAME = "nginx-sample-app"
        REGISTRY = "your-docker-registry"  // Replace with your registry (e.g., Docker Hub, AWS ECR)
        TAG = "latest"
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the source code (Dockerfile and index.html)
                git 'https://github.com/your-repo/nginx-sample-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh "docker build -t ${REGISTRY}/${IMAGE_NAME}:${TAG} ."
                }
            }
        }

        stage('Test Docker Image') {
            steps {
                script {
                    // Run a container to ensure the image works
                    sh "docker run --rm -d -p 8080:80 ${REGISTRY}/${IMAGE_NAME}:${TAG}"
                    // Wait a few seconds to ensure NGINX starts
                    sleep(time: 10, unit: "SECONDS")
                    // Use curl to check if the server is running
                    sh "curl -f http://localhost:8080"
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to a registry
                    sh "docker push ${REGISTRY}/${IMAGE_NAME}:${TAG}"
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Example of deployment, for instance, using Docker Compose or ECS.
                    // In this case, we'll deploy with Docker run as a simple example:
                    sh "docker run -d -p 8080:80 ${REGISTRY}/${IMAGE_NAME}:${TAG}"
                }
            }
        }
    }

    post {
        always {
            // Clean up any resources, containers, or images
            sh "docker system prune -f"
        }
    }
}
