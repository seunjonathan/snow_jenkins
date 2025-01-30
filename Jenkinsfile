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

                script {
                    // Get the current user
                    CURRENT_USER = sh(script: 'whoami', returnStdout: true).trim()
                    echo "Current user: ${CURRENT_USER}"
                }
                sh """
                chown ${CURRENT_USER} config.toml
                chmod 0600 config.toml
                ls -l config.toml
                """
            }
        }

        stage('Run Snowflake CLI') {
            steps {
                sh """"
                pip install snowflake-cli --upgrade
                snow --config-file config.toml
                snow --info
                """
                // sh "snow --config-file config.toml connection myconnection"
                // sh "snow connection set-default snowjan2025"
                // sh "snow sql -q \"select count(*) from sales;\" "
                // withCredentials([string(credentialsId: 'snowflake-password', variable: 'SNOWFLAKE_PASSWORD1')])
                // {
                // // sh "dir .snowflake"

                // sh "snow --config-file connections.toml"
                // }
                // sh "snow connection list"
                // sh "snow connection test -c snowjan2025"
                // sh "snow sql -q \"select count(*) from sales;\" --account POOGGWP-EQA42460 --user SEUNJONATHAN --database practice --schema public --role accountadmin --warehouse compute_wh --password ${params.SNOWFLAKE_PASSWORD} "
            }
        }
    }
}