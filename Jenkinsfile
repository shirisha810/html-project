pipeline {
    agent any
         stages{
    
    stage ('git clone') {
            steps {
        echo "code is building"
         git 'https://github.com/shirisha810/html-project.git'
            }
        }

        stage ('Bulding docker docker image') {
            steps {
                echo "build docker image"
                sh 'docker build --no-cache -t 758671678745.dkr.ecr.ap-south-1.amazonaws.com/html-project .'
            }
        }
          stage ('pushing the docker image') {
            steps {
                
                sh 'docker push 758671678745.dkr.ecr.ap-south-1.amazonaws.com/html-project'
            }
        }
         stage ('deploying to EKS') {
           steps {
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl set image deployment/httpd-deployment httpd2=758671678745.dkr.ecr.ap-south-1.amazonaws.com/html-project:latest'
                sh 'kubectl apply -f service.yaml'
                sh 'kubectl rollout restart deployment/httpd-deployment'
                sh 'docker rmi -f $(docker images --filter "dangling=true" -q --no-trunc)'
               
           }
    }  
         }       
         
}
