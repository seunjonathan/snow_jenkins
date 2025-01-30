pipeline {
    agent { 
        docker { 
            image "python:3.8"
            args '--user 0:0'
        } 
    }
    stages {
        stage('Echo SF_ROLE') {
            steps {
                echo "The value of SF_ROLE is: ${params.SNOWFLAKE_ROLE}"
            }
        }

        stage('Run Snowflake CLI') {
            steps {
                sh "pip install snowflake-cli --upgrade"
                withCredentials([string(credentialsId: 'snowflake-password', variable: 'SNOWFLAKE_PASSWORD1')])
                {
                // sh "dir .snowflake"

                sh "snow connection add -n myconnection2 --account POOGGWP-EQA42460 --user SEUNJONATHAN --database practice --schema public --role accountadmin --warehouse compute_wh "
                }
                sh "snow connection list"
                sh "snow connection test -c myconnection2"
                // sh "snow sql -q \"select count(*) from sales;\" --account POOGGWP-EQA42460 --user SEUNJONATHAN --database practice --schema public --role accountadmin --warehouse compute_wh --password ${params.SNOWFLAKE_PASSWORD} "
            }
        }
    }
}