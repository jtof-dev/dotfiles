import keyboard
import subprocess
import re


def main():
    volumeFile = "volume.txt"
    volumePercent = "5"
    processNumberCommand = "wpctl status | sed -n '/Streams/,/^\\s*$/p'"
    templateVolumeChangeCommandUp = "wpctl set-volume {{processNumber}} {{value}}%+"
    templateVolumeChangeCommandDown = "wpctl set-volume {{processNumber}} {{value}}%-"

    processNumber = getProcessNumber(processNumberCommand)
    volumeChangeCommandUp, volumeChangeCommandDown = generateVolumeCommands(
        templateVolumeChangeCommandUp,
        templateVolumeChangeCommandDown,
        processNumber,
        volumePercent,
    )
    hotkey(volumeChangeCommandUp, volumeChangeCommandDown, volumeFile)


def getProcessNumber(processNumberCommand):
    output = subprocess.run(
        processNumberCommand, shell=True, text=True, capture_output=True
    )
    print(output.stdout)
    pattern = re.compile(r"(\d+)\.\s+.*\[spotify_player\]")

    match = pattern.search(output.stdout)
    if match:
        processNumber = str(match.group(1))
        print(f"Matched text: {match.group()}")
        print(f"Extracted number: {processNumber}")
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


def hotkey(volumeChangeCommandUp, volumeChangeCommandDown, volumeFile):
    keyboard.add_hotkey(
        "page up",
        lambda: volumeChange(
            volumeChangeCommandUp,
            volumeChangeCommandDown,
            volumeFile,
            volumeUpOrDown="up",
        ),
        suppress=True,
    )
    keyboard.add_hotkey(
        "page down",
        lambda: volumeChange(
            volumeChangeCommandUp,
            volumeChangeCommandDown,
            volumeFile,
            volumeUpOrDown="down",
        ),
        suppress=True,
    )
    keyboard.wait("esc")


def volumeChange(
    volumeChangeCommandUp, volumeChangeCommandDown, volumeFile, volumeUpOrDown
):
    if volumeUpOrDown == "up":
        subprocess.run(volumeChangeCommandUp)
    else:
        subprocess.run(volumeChangeCommandDown)
    # writeVolumeToFile(volumeFile)


# def writeVolumeToFile(volumeFile):

if __name__ == "__main__":
    main()
