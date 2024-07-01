// pipeline {
//     agent any
//     stages {
//         stage('Run schemachange') {
//             steps {
//                 echo 'Install schema changes'
//                 sh "pip install schemachange --upgrade"
//                 sh "schemachange -f migrations -a ${SF_ACCOUNT} -u ${SF_USERNAME} -r ${SF_ROLE} -w ${SF_WAREHOUSE} -d ${SF_DATABASE} -c ${SF_DATABASE}.SCHEMACHANGE.CHANGE_HISTORY --create-change-history-table"
//             }
//         }
//     }
// }

pipeline {
    agent any
    
    stages {
        stage('Run schemachange') {
            steps {
                script {
                    try {
                        echo 'Install schema changes'
                        sh "pip install schemachange --upgrade"
                        
                        def command = "schemachange -f migrations -a ${SF_ACCOUNT} -u ${SF_USERNAME} -r ${SF_ROLE} -w ${SF_WAREHOUSE} -d ${SF_DATABASE} -c ${SF_DATABASE}.SCHEMACHANGE.CHANGE_HISTORY --create-change-history-table"
                        
                        if (isUnix()) {
                            // Unix/Linux
                            sh "nohup ${command} &"
                        } else {
                            // Windows
                            sh "${command}"
                        }
                    } catch (Exception e) {
                        currentBuild.result = 'FAILURE'
                        echo "Failed to run schemachange: ${e.message}"
                        error("Failed to run schemachange")
                    }
                }
            }
        }
    }
}
