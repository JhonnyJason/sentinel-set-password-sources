############################################################
export pwdSalt = "holderradio!...<3)()0981salty"


############################################################
#region URLs

############################################################
# Access Manager URL
# url = "https://sentinel-access-manager-dev.dotv.ee"
url = "https://localhost:6111"
if window.location.origin == "https://sentinel-set-pwd.ewag-handelssysteme.de"
    url = "https://sentinel-access-manager.dotv.ee"
export urlAccessManager = url

############################################################
# Dashboard URL
# url = "https://sentinel-dashboard-dev.dotv.ee"
url = "https://localhost:3333"
if window.location.origin == "https://sentinel-set-pwd.ewag-handelssysteme.de"
    url = "https://sentinel.ewag-handelssysteme.de"
export urlSentinelDashboard = url

#endregion
