pipeline {
    agent { 
        docker { 
            image "python:3.8"
            args '--user 0:0'
        } 
    }

    environment {
        // Static environment variables
        // SNOWFLAKE_CONNECTIONS_MYCONNECTION_ACCOUNT = "POOGGWP-EQA42460"
        // SNOWFLAKE_CONNECTIONS_MYCONNECTION_USER = "SEUNJONATHAN"
        SNOWFLAKE_CONNECTIONS_MYCONNECTION_ROLE = "ACCOUNTADMIN"
        // SNOWFLAKE_CONNECTIONS_MYCONNECTION_WAREHOUSE = "COMPUTE_WH"
        // SNOWFLAKE_CONNECTIONS_MYCONNECTION_SCHEMA = "PUBLIC"
        // SNOWFLAKE_CONNECTIONS_MYCONNECTION_DATABASE = "SEASPAN"
    }


    stages {
        stage('Echo Username') {
            steps {
                script {
                    // Get the current user
                    CURRENT_USER = sh(script: 'whoami', returnStdout: true).trim()
                    echo "Current user: ${CURRENT_USER}"
                }
                // Restrict permissions on toml file to current user 
                sh """
                chown ${CURRENT_USER} .snowflake/config.toml
                chmod 0600 .snowflake/config.toml
                ls -l .snowflake/config.toml
                """
            }
        }

        stage('Run Snowflake CLI') {
            steps {
                
                script {
                
                sh "pip install snowflake-cli --upgrade"

                //  withCredentials([string(credentialsId: 'snowflake-password', variable: 'SNOWFLAKE_PASSWORD')]) {
                //         env.SNOWFLAKE_CONNECTIONS_MYCONNECTION_PASSWORD = SNOWFLAKE_PASSWORD
                //  }
                
                sh """
                snow --info
                snow connection list
                snow connection test
                snow sql -q \"select count(*) from sales;\"
                """
            }
            }
        }
    }
}