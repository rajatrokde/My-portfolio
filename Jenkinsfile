pipeline {
    agent any 
    
    stages{
        stage("Clone Code"){
            steps {
                echo "Cloning the code"
                git url:"https://github.com/rajatrokde/My-portfolio.git", branch: "main"
            }
        
        }
        stage("Build"){
            steps {
                echo "Building the image"
                sh "docker build -t demoportfolio:v1 ." 
            }
        }
        stage("Deploy"){
            steps {
                echo "Deploying the container"
                sh "docker run -p 80:80 demoportfolio:v1 "
                
            }
        }
        
        stage("Push to Docker Hub"){
            steps {
                echo "Pushing the image to docker hub"
                    withCredentials([usernamePassword(credentialsId: "dockerHub", passwordVariable: "dockerHubPass", usernameVariable: "dockerHubUser")]) {
                    sh "docker tag demoportfolio ${env.dockerHubUser}/demoportfolio:v1"
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                    sh "docker push ${env.dockerHubUser}/demoportfolio:v1"
                    
                }
            }
    }
    
}
}
