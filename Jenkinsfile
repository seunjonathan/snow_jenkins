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
    stages {
        stage('Run Snowflake CLI') {
            steps {
                sh "dir .snowflake"
                // sh "pip install snowflake-cli --upgrade"
                // sh "snow sql -q \"select count(*) from sales;\" "

            }
        }
    }
}



                // sh "schemachange -f migrations -a ${SF_ACCOUNT} -u ${SF_USERNAME} -r ${SF_ROLE} -w ${SF_WAREHOUSE} -d ${SF_DATABASE} -c ${SF_DATABASE}.SCHEMACHANGE.CHANGE_HISTORY --create-change-history-table"
