node {
    properties([
            buildDiscarder(logRotator(numToKeepStr: '10')),
            [$class: 'ScannerJobProperty', doNotScan: false],
            [$class: 'RebuildSettings', autoRebuild: false, rebuildDisabled: false],
            [$class: 'JobLocalConfiguration', changeReasonComment: ''],
            parameters([
                string(
                    name: 'SF_ACCOUNT',
                    defaultValue: '',
                    description: 'SF_ACCOUNT',
                    trim: true
                ),
                string(
                    name: 'SF_USERNAME',
                    defaultValue: '',
                    description: 'SF_USERNAME',
                    trim: true
                ),
                // password(
                //     name: 'SNOWFLAKE_PASSWORD',
                //     description: 'SNOWFLAKE_PASSWORD'
                // ),
                string(
                    name: 'SF_ROLE',
                    defaultValue: '',
                    description: 'SF_ROLE',
                    trim: true
                ),
                string(
                    name: 'SF_WAREHOUSE',
                    defaultValue: '',
                    description: "SF_WAREHOUSE",
                    trim: true
                ),
                string(
                    name: 'SF_DATABASE',
                    defaultValue: '',
                    description: "SF_DATABASE",
                    trim: true
                )
            ])
        ])
    
    stage('Schema Changes Setup') {
        SNOWFLAKE_PASSWORD = 'Terraform1'
 
        echo 'Install schema changes'
        sh "pip install schemachange --upgrade"
        echo 'Run schema changes'
        sh "/home/jenkins/.local/bin/schemachange -f migrations -a ${SF_ACCOUNT} -u ${SF_USERNAME} -r ${SF_ROLE} -w ${SF_WAREHOUSE} -d ${SF_DATABASE} -c ${SF_DATABASE}.SCHEMACHANGE.CHANGE_HISTORY --create-change-history-table"
        // sh "pip install schemachange --upgrade"
    }
    
    // stage('Run Schema Changes') {
    //     echo 'Run schema changes'
    //     sh "schemachange -f migrations -a ${SF_ACCOUNT} -u ${SF_USERNAME} -r ${SF_ROLE} -w ${SF_WAREHOUSE} -d ${SF_DATABASE} -c ${SF_DATABASE}.SCHEMACHANGE.CHANGE_HISTORY --create-change-history-table"
    // }
}

