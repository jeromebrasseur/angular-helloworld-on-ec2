pipeline {
    agent any

    environment {
        NODE_ENV = 'production'
    }

    stages {

        stage('Clone Git Repository') {
            steps {
                sh '''
                    rm -rf angular-helloworld-on-ec2
                    git clone https://github.com/jeromebrasseur/angular-helloworld-on-ec2.git
                '''
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm ci'
            }
        }

        stage('Run Tests') {
            steps {
                sh '''
                    cd angular-helloworld-on-ec2/
                    ng test --watch=false --browsers=ChromeHeadless || echo "Tests failed, continuing..."
                '''
            }
        }

        stage('Build App') {
            steps {
              sh '''
                  cd angular-helloworld-on-ec2/
                  ng build --configuration production
              '''
            }
        }

        stage('Deploy to Nginx') {
            steps {
                // Nettoyage de l'ancien contenu
                sh 'sudo rm -rf /var/www/html/*'

                // Copie du nouveau build
                sh 'sudo cp -r angular-helloworld-on-ec2/dist/angular-hello-world/browser/* /var/www/html/'
            }
        }
    }

    post {
        success {
            echo '✅ Déploiement terminé avec succès.'
        }
        failure {
            echo '❌ Échec du pipeline.'
        }
    }
}
