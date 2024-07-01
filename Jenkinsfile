node {
    //def myAgent = 'any'

    
        stage('Run schemachange') {
            //agent { label myAgent }
            
                echo 'Install schema changes'
                    bat 'pip install schemachange --upgrade'
                    echo 'Run schema changes'
                    bat "schemachange -f migrations -a \"%SF_ACCOUNT%\" -u \"%SF_USERNAME%\" -r \"%SF_ROLE%\" -w \"%SF_WAREHOUSE%\" -d \"%SF_DATABASE%\" -c \"%SF_DATABASE%.SCHEMACHANGE.CHANGE_HISTORY\" --create-change-history-table"
                
        }
    
}