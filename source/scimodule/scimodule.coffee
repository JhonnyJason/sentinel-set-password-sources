############################################################
#region debug
import { createLogFunctions } from "thingy-debug"
{log, olog} = createLogFunctions("scimodule")
#endregion

############################################################
import {
    createValidator, STRING, STRINGHEX32, STRINGHEX64,
    STRINGEMAIL
} from "thingy-schema-validate"

############################################################
import { urlAccessManager } from "./configmodule.js"

############################################################
finalizeActionArgsSchema = { 
    code: STRINGHEX32, 
    type: STRING, 
    email: STRINGEMAIL, 
    passwordSH: STRINGHEX64 
}
validateFinalizeActionArgs = createValidator(finalizeActionArgsSchema)
urlFinalizeAction = urlAccessManager+"/finalizeAction"

############################################################
export finalizeAction = (args) ->
    log "finalizeAction"
    err = validateFinalizeActionArgs(args)
    if err then throw new Error("Invlid Arguments! (#{err})")
    
    options =
        method: 'POST'
        mode: 'cors'
    
        body: JSON.stringify(args)
        headers:
            'Content-Type': 'application/json'

    try response = await fetch(urlFinalizeAction, options)
    catch err then throw new Error("Network Error: "+err.message)

    ## we should get 204 without content
    if response.ok then return

        ## Any Error will not be "OK" - and might have an error Messge for us...
    try errorMessage = await response.text()
    catch err then throw new Error("ErrorParsing Error: "+err.message)

    throw new Error(errorMessage)
    return