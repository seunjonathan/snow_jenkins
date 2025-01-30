pipeline {
    agent { 
        docker { 
            image "python:3.8"
            args '--user 0:0'
        } 

    }
    // environment {
    //     SNOWFLAKE_PASSWORD = credentials('SNOWFLAKE_PASSWORD') // Reference the credential ID
    // }
    stage('Echo SF_ROLE') {
            steps {
                echo "The value of SF_ROLE is: ${env.SF_ROLE}"
            }
        }
    stages {
        stage('Run Snowflake CLI') {
            steps {
                sh "dir .snowflake"
                // sh "pip install snowflake-cli --upgrade"
                // sh "snow connection list"
                // sh "snow sql --config-file=\"config.toml\" connection myconnection -q \"select count(*) from sales;\" "

            }
        }
    }
}



                // sh "schemachange -f migrations -a ${SF_ACCOUNT} -u ${SF_USERNAME} -r ${SF_ROLE} -w ${SF_WAREHOUSE} -d ${SF_DATABASE} -c ${SF_DATABASE}.SCHEMACHANGE.CHANGE_HISTORY --create-change-history-table"
