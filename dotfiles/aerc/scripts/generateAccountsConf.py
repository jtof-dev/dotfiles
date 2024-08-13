#!/bin/python

import os


def main():
    refreshTokenFile = "/home/andya/.config/aerc/scripts/aab726RefreshToken"
    aab726TemplateFile = "/home/andya/.config/aerc/scripts/aab726Template"
    clientId = os.environ.get("AERC_CLIENT_ID")
    clientSecret = os.environ.get("AERC_CLIENT_SECRET")

    with open(aab726TemplateFile, "r") as file:
        aab726TemplateFileContents = file.read()

    aab726File = "/home/andya/.config/aerc/accounts/aab726@nau.edu"
    accountsFolder = "/home/andya/.config/aerc/accounts/"
    accountsConfFile = "/home/andya/.config/aerc/accounts.conf"

    with open(refreshTokenFile, "r") as file:
        refreshToken = file.read()

    formattedRefreshToken = formatRefreshToken(refreshToken)
    generateAab726(
        formattedRefreshToken,
        clientId,
        clientSecret,
        aab726TemplateFileContents,
        aab726File,
    )
    generateAccountsConf(accountsFolder, accountsConfFile)


def formatRefreshToken(refreshToken):
    formattedRefreshToken = refreshToken.replace("/", "%2F")
    return formattedRefreshToken


def generateAab726(
    formattedRefreshToken,
    clientId,
    clientSecret,
    aab726TemplateFileContents,
    aab726File,
):
    aab726 = (
        aab726TemplateFileContents.replace("{refresh token}", formattedRefreshToken)
        .replace("{id}", clientId)
        .replace("{secret}", clientSecret)
    )
    with open(aab726File, "w") as file:
        file.write(aab726)


def generateAccountsConf(accountsFolder, accountsConfFile):
    accountsList = os.listdir(accountsFolder)
    tempAccounts = ""

    for file in accountsList:
        filePath = accountsFolder + file

        with open(filePath, "r") as readFile:
            fileContents = readFile.read()

        formattedFile = fileContents + "\n"
        tempAccounts += formattedFile

    with open(accountsConfFile, "w") as file:
        file.write(tempAccounts)


if __name__ == "__main__":
    main()
