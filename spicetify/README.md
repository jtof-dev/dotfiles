# spicetify

- spicetify is very nice to have, but an absolute nightmare to install for the first time. for my own ease of use, I am including a copy of the `.config/spicetify` directory

- to set everything up, run some combination of the following:

```
spicetify backup apply
spicetify config inject_css 1
spicetify config replace_colors 1
spicetify config current_theme marketplace

spicetify config custom_apps marketplace
spicetify apply

spicetify config custom_apps betterLibrary
spicetify config custom_apps history-in-sidebar
spicetify config custom_apps stats
spicetify apply
```

- which should, theoretically, work. though, I'm not sure if this will sync over snippets, since I am `gitignore`ing the `Backup` and `Extracted` folders