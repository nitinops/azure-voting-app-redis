pipeline{

  agent any 
    try {
        stages{
            stage("Ankit") {
                steps {
                    parallel (
                       'firstTask' : { 
                            build( "Ankit@tech" )
                        },
                        'secondTask' : { 
                            build( "Nitin@tech" )
                        }
                    )
                }
            }
            stage("Upender") {
                steps {
                        build( "Upender@tech" )
                        build( "Sunita@tech" )
                }
            }
            stage("Nonu") {
                steps{
                    parallel (
                        "thirdTask" : { 
                            build( "Nonu@tech" )
                        },
                        "forthTask" : { 
                            build( "Noni@tech" )
                        }
                    )
                }
            }
        }
    }   

    catch(all) {
        currentBuild.result = 'FAILURE'
    }   
