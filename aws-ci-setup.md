Pipeline Stages

1. Build Stage

Configure Jenkins to build your application:

Install necessary build tools and dependencies.

If using Python, ensure you have pip and virtualenv installed.

Example Jenkins pipeline script snippet:

pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }
    }
}

2. Test Stage

Run tests as part of the CI process:

Ensure test frameworks (e.g., pytest for Python) are installed.

Example test execution command:

stage('Test') {
    steps {
        sh 'pytest tests/'
    }
}

3. Deploy Stage

Deploy the application to an EC2 instance:

Configure SSH access to the instance.

Transfer necessary files using SCP.

Restart the application service if necessary.

stage('Deploy') {
    steps {
        sh 'scp -i key.pem app.py ec2-user@your-ec2-instance:/home/ec2-user/app.py'
        sh 'ssh -i key.pem ec2-user@your-ec2-instance "sudo systemctl restart app-service"'
    }
}

