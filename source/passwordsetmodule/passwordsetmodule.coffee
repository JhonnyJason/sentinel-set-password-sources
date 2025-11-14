############################################################
#region debug
import { createLogFunctions } from "thingy-debug"
{log, olog} = createLogFunctions("noaccountmodule")
#endregion

############################################################
import { sha256 } from "secret-manager-crypto-utils"
import { pwdSalt,  urlSentinelDashboard } from "./configmodule.js"
import { finalizeAction } from "./scimodule.js"

############################################################
code = ""
actionType = ""

############################################################
mainElement = null

############################################################
specialState = false

############################################################
export initialize = ->
    log "initialize"
    paramsString = window.location.search
    searchParams = new URLSearchParams(paramsString)

    code = searchParams.get("code")
    actionType = searchParams.get("action")

    if !(code or actionType) then return  window.location.replace(urlSentinelDashboard);
    passwordsetForm.addEventListener("submit", handleConfirmation)

    sentinelDashboardLink.setAttribute("href", urlSentinelDashboard)
    mainElement = document.getElementsByTagName("main")[0]
    
    return

setError = (error) ->
    log "setError"
    mainElement.className = "error"
    emailInput.addEventListener("keyup", emailInputKeyUp)
    return

setSuccess = ->
    log "setSuccess"
    mainElement.className = "success"
    return

emailInputKeyUp = ->
    log "emailInputKeyUp"
    mainElement.className = ""
    emailInput.removeEventListener("keyup", emailInputKeyUp)
    return

handleConfirmation = (evnt) ->
    log "handleConfirmation"
    evnt.preventDefault()
    if !code or !actionType then return setError("No code or actionType!")

    email = emailInput.value
    password = passwordInput.value
    type = actionType
    passwordSH = await sha256(pwdSalt+password)
    
    requestData = {code, type, email, passwordSH}
    ## execute request
    try await finalizeAction(requestData)
    catch err then return setError(err.message)
    
    return setSuccess()
