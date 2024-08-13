import os
import subprocess

# result = subprocess.run("ya pack -u", shell=True, text=True, capture_output=True)
# print(result.stdout)
plugins_folder = "plugins/"
for entry in os.listdir(plugins_folder):
    directory = os.path.join(plugins_folder, entry)
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
