#!/bin/python

import subprocess
import re


def main():
    volumePercent = "5"
    processNumberCommand = "wpctl status | sed -n '/Streams/,/^\\s*$/p'"
    templateVolumeChangeCommandUp = "wpctl set-volume {{processNumber}} {{value}}%+"
    templateVolumeChangeCommandDown = "wpctl set-volume {{processNumber}} {{value}}%-"
    volumeUpScript = (
        "/home/andya/scripts/spotifyPipewireVolumeControl/spotifyVolumeUp.sh"
    )
    volumeDownScript = (
        "/home/andya/scripts/spotifyPipewireVolumeControl/spotifyVolumeDown.sh"
    )

    processNumber = getProcessNumber(processNumberCommand)
    volumeChangeCommandUp, volumeChangeCommandDown = generateVolumeCommands(
        templateVolumeChangeCommandUp,
        templateVolumeChangeCommandDown,
        processNumber,
        volumePercent,
    )
    writeVolumeCommands(
        volumeUpScript, volumeDownScript, volumeChangeCommandUp, volumeChangeCommandDown
    )


def getProcessNumber(processNumberCommand):
    output = subprocess.run(
        processNumberCommand, shell=True, text=True, capture_output=True
    )
    # print(output.stdout)
    pattern = re.compile(r"(\d+)\.\s+spotify")

    match = pattern.search(output.stdout)
    if match:
        processNumber = str(match.group(1))
        # print(f"Matched text: {match.group()}")
        # print(f"Extracted number: {processNumber}")
        return processNumber
    else:
        print("Process not found.")


def generateVolumeCommands(
    templateVolumeChangeCommandUp,
    templateVolumeChangeCommandDown,
    processNumber,
    volumePercent,
):
    volumeChangeCommandUp = templateVolumeChangeCommandUp.replace(
        "{{processNumber}}", processNumber
    ).replace("{{value}}", volumePercent)
    volumeChangeCommandDown = templateVolumeChangeCommandDown.replace(
        "{{processNumber}}", processNumber
    ).replace("{{value}}", volumePercent)
    return volumeChangeCommandUp, volumeChangeCommandDown


def writeVolumeCommands(
    volumeUpScript, volumeDownScript, volumeChangeCommandUp, volumeChangeCommandDown
):
    volumeChangeCommandUpSchebang = "#!/bin/bash\n\n" + volumeChangeCommandUp
    volumeChangeCommandDownSchebang = "#!/bin/bash\n\n" + volumeChangeCommandDown
    with open(volumeUpScript, "w") as up:
        up.write(volumeChangeCommandUpSchebang)
    with open(volumeDownScript, "w") as down:
        down.write(volumeChangeCommandDownSchebang)


if __name__ == "__main__":
    main()
