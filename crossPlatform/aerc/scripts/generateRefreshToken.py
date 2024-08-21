#!/bin/python

import json
import os
import subprocess
import urllib.parse
import urllib.request

import generateAccountsConf


def main():
    redirectUri = "https://oauth2.dance/"
    googleAccountsBaseUrl = "https://accounts.google.com"

    homeDirectory = subprocess.run(
        "echo $HOME", shell=True, text=True, capture_output=True
    ).stdout[:-1]
    refeshTokenFile = homeDirectory + "/.config/aerc/scripts/aab726RefreshToken"

    clientId = os.environ.get("AERC_CLIENT_ID")
    clientSecret = os.environ.get("AERC_CLIENT_SECRET")

    oauthUrl = generatePermissionUrl(clientId, redirectUri, googleAccountsBaseUrl)
    print(oauthUrl)
    oauthUrlCommand = "xdg-open '" + oauthUrl + "'"

    subprocess.run(oauthUrlCommand, shell=True, text=True)

    authorizationCode = input("Enter verification code: ")
    response = authorizeTokens(
        clientId, clientSecret, authorizationCode, redirectUri, googleAccountsBaseUrl
    )
    print("Refresh Token: %s" % response["refresh_token"])
    writeRefreshTokenToFile(refeshTokenFile, response["refresh_token"])
    generateAccountsConf.main()


def generatePermissionUrl(client_id, redirectUri, googleAccountsBaseUrl):
    scope = "https://mail.google.com/"
    params = {}
    params["client_id"] = client_id
    params["redirect_uri"] = redirectUri
    params["scope"] = scope
    params["response_type"] = "code"
    params["access_type"] = "offline"
    params["prompt"] = "consent"
    return "%s?%s" % (
        accountsUrl(googleAccountsBaseUrl, "o/oauth2/auth"),
        formatUrlParams(params),
    )


def accountsUrl(googleAccountsBaseUrl, command):
    return "%s/%s" % (googleAccountsBaseUrl, command)


def formatUrlParams(params):
    param_fragments = []
    for param in sorted(params.items(), key=lambda x: x[0]):
        param_fragments.append("%s=%s" % (param[0], urlEscape(param[1])))
    return "&".join(param_fragments)


def urlEscape(text):
    # See OAUTH 5.1 for a definition of which characters need to be escaped.
    return urllib.parse.quote(text, safe="~-._")


def authorizeTokens(
    clientId, clientSecret, authorizationCode, redirectUri, googleAccountsBaseUrl
):
    params = {}
    params["client_id"] = clientId
    params["client_secret"] = clientSecret
    params["code"] = authorizationCode
    params["redirect_uri"] = redirectUri
    params["grant_type"] = "authorization_code"
    request_url = accountsUrl(googleAccountsBaseUrl, "o/oauth2/token")

    response = urllib.request.urlopen(
        request_url, urllib.parse.urlencode(params).encode("utf-8")
    ).read()
    return json.loads(response)


def writeRefreshTokenToFile(refreshTokenFile, refreshToken):
    with open(refreshTokenFile, "w") as file:
        file.write(refreshToken)


if __name__ == "__main__":
    main()
