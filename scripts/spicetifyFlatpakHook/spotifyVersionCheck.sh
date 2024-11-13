#!/bin/bash

spotifyVersion="$HOME/scripts/spicetifyFlatpakHook/.spotifyVersion"
current_version=$(flatpak list --app | grep com.spotify.Client | awk '{print $3}')
previous_version=$(cat "$spotifyVersion")

if [[ "$current_version" != "$previous_version" ]]; then
	echo "spotify updated to version $current_version"

	chmod a+wr /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify
	chmod a+wr /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify/Apps -R
	spicetify backup apply

	echo "$current_version" >"$spotifyVersion"
fi
