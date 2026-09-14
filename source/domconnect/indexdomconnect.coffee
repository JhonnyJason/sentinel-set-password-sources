indexdomconnect = {name: "indexdomconnect"}

############################################################
indexdomconnect.initialize = () ->
    global.passwordsetForm = document.getElementById("passwordset-form")
    global.emailInput = document.getElementById("email-input")
    global.passwordInput = document.getElementById("password-input")
    global.sentinelDashboardLinkSuccess = document.getElementById("sentinel-dashboard-link-success")
    global.sentinelDashboardLinkError = document.getElementById("sentinel-dashboard-link-error")
    return
    
module.exports = indexdomconnect