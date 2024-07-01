pipeline {
    agent any
    stages {
        stage('Run schemachange') {
            steps {
                SNOWFLAKE_PASSWORD = 'Terraform1'
                echo 'Install schema changes'
                sh "pip install schemachange --upgrade"
                sh "schemachange -f migrations -a ${SF_ACCOUNT} -u ${SF_USERNAME} -r ${SF_ROLE} -w ${SF_WAREHOUSE} -d ${SF_DATABASE} -c ${SF_DATABASE}.SCHEMACHANGE.CHANGE_HISTORY --create-change-history-table"
            }
        }
    }
}