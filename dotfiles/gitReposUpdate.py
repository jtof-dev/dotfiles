#!/bin/python

import os
import subprocess

for directory in os.listdir("./"):
    if os.path.isdir(directory):
        try:
            result = subprocess.run(
                ["git", "-C", directory, "pull"], capture_output=True, text=True
            )
            print(f"Output for {directory}:")
            print(result.stdout)
            if result.stderr:
                print(f"Error for {directory}:")
                print(result.stderr)
        except Exception as e:
            print(f"An error occurred for {directory}: {e}")
