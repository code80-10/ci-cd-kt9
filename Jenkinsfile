pipeline {
    agent any

    parameters {
        booleanParam(name: 'DEBUG', defaultValue: false, description: 'Build with debug symbols and DEBUG macro')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                echo "Branch: ${env.BRANCH_NAME ?: 'single-branch pipeline'}"
            }
        }

        stage('Develop Branch Info') {
            when {
                branch 'develop'
            }
            steps {
                echo 'Running the develop branch pipeline'
            }
        }

        stage('Build') {
            steps {
                script {
                    def debugValue = params.DEBUG ? '1' : '0'
                    bat "make clean && make DEBUG=${debugValue}"
                }
            }
        }

        stage('Run/Test') {
            steps {
                bat 'build\\app.exe'
            }
        }
    }
}
