#!/bin/python

import argparse
import subprocess
import re


def main():
    parser = argparse.ArgumentParser(
        description="set the wireplumber volume change command for spotify or spotify-player"
    )
    parser.add_argument(
        "-oda",
        "--official_desktop_app",
        action="store_true",
        help="selects the Spotify Desktop Program",
    )
    parser.add_argument(
        "-cli",
        "--spotify_cli",
        action="store_true",
        help="selects the spotify-player CLI Program",
    )
    parser.add_argument(
        "-psst",
        "--psst_gui",
        action="store_true",
        help="selects the Psst Desktop Program",
    )
    parser.add_argument(
        "-all",
        "--try_all_sources",
        action="store_true",
        help="Tries all sources, and saves the first one found",
    )

    args = parser.parse_args()

    volumePercent = "5"
    processNumberCommand = "wpctl status | sed -n '/Streams/,/^\\s*$/p'"
    templateVolumeChangeCommandUp = "wpctl set-volume {{processNumber}} {{value}}%+"
    templateVolumeChangeCommandDown = "wpctl set-volume {{processNumber}} {{value}}%-"
    volumeUpScript = "/home/andya/scripts/spotifyVolumeControl/spotifyVolumeUp.sh"
    volumeDownScript = "/home/andya/scripts/spotifyVolumeControl/spotifyVolumeDown.sh"

    processNumber = getProcessNumber(processNumberCommand, args)
    volumeChangeCommandUp, volumeChangeCommandDown = generateVolumeCommands(
        templateVolumeChangeCommandUp,
        templateVolumeChangeCommandDown,
        processNumber,
        volumePercent,
    )
    writeVolumeCommands(
        volumeUpScript, volumeDownScript, volumeChangeCommandUp, volumeChangeCommandDown
    )


def getProcessNumber(processNumberCommand, args):
    patterns = [
        re.compile(r"(\d+)\.\s+spotify"),
        re.compile(r"(\d+)\.\s+spotify-player"),
        re.compile(r"(\d+)\.\s+PipeWire ALSA \[psst\-gui\]"),
    ]

    if args.official_desktop_app:
        pattern = patterns[0]
    elif args.spotify_cli:
        pattern = patterns[1]
    elif args.psst_gui:
        pattern = patterns[2]
    elif args.try_all_sources:
        for pattern in patterns:
            processNumber = matchProcessNumber(processNumberCommand, pattern)
            if processNumber:
                break
        if not processNumber:
            raise ValueError("No processes found.")
        return processNumber
    else:
        raise ValueError("flag not set")

    return matchProcessNumber(processNumberCommand, pattern)


def matchProcessNumber(processNumberCommand, pattern):
    output = subprocess.run(
        processNumberCommand, shell=True, text=True, capture_output=True
    )
    # print(output.stdout)

    match = pattern.search(output.stdout)
    if match:
        processNumber = str(match.group(1))
        # print(f"Matched text: {match.group()}")
        # print(f"Extracted number: {processNumber}")
        return processNumber


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
