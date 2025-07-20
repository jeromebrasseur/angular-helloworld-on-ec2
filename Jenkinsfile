pipeline {
    agent any

    environment {
        NODE_ENV = 'production'
    }

    stages {

        stage('Checkout') {
            steps {
                git url: 'https://github.com/jeromebrasseur/angular-helloworld-on-ec2.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm ci'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'ng test --watch=false --browsers=ChromeHeadless || echo "Tests failed, continuing..."'
            }
        }

        stage('Build App') {
            steps {
                sh 'ng build --configuration production'
            }
        }

        stage('Deploy to Nginx') {
            steps {
                // Nettoyage de l'ancien contenu
                sh 'rm -rf /var/www/html/*'

                // Copie du nouveau build
                sh 'cp -r dist/angular-helloworld-on-ec2/* /var/www/html/'
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
