  #Guidelines to create a new classificationAlgorithm

  #R6 Class implementing the algorithm
  R6_Dummy_C <- R6::R6Class("R6_Dummy_C",
  #Replace Dummy_C with the class name

    #Inherit from classification algorithm
    inherit = ClassificationAlgorithm,

    public = list(

      #Algorithm parameters separated with commas
      param1 = 3,
      param2 = TRUE,

      #setParameters function
      setParameters = function(train, test, param1, param2){

        #Call the super$setParameters function
        super$setParameters(train, test)

        #Check for any data constraints
        if((isMultiClass(train))||(isMultiClass(test))){
          stop("Does not accept multi-class dataset.")
        }

        #Assign parameters value
        self$param1 <- param1
        self$param2 <- param2
      }

    ),

    private = list(

      #jar Filename
      jarName = "Dummy.jar",

      #algorithm name in KEEL
      algorithmName = "Dummy-C",

      #String with algorithm name
      #(in first line of configuration file)
      algorithmString = "Dummy Classifier",

      #Get the text with the parameters for config file
      getParametersText = function(){

        #Parameters list as in KEEL configuration file
        text <- ""
        text <- paste0(text, "P1 = ", self$param1, "\n")
        text <- paste0(text, "P2 = ", self$param2, "\n")

        return(text)
      }
    )
  )

  #Create alias for easier use and better documentation
  Dummy_C <- function(train, test){
    alg <- RKEEL::R6_Dummy_C$new()
    alg$setParameters(train, test)
    return (alg)
  }
