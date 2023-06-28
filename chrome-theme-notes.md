# Chrome Theme Notes

## Colors

Light grey: 149, 149, 149

Normal grey: 39, 39, 39

Dark grey: 20, 20, 20

## `manifest.json` with notes

colors:
    "bookmark_text": [ 241, 243, 244 ], --> change to white
    "frame": [ 32, 33, 36 ], --> the top bar banner when active - use dark grey
    "frame_inactive": [ 60, 64, 67 ], --> top bar banner inactive - use normal grey
    "ntp_background": [ 50, 54, 57 ], --> the color of the bar around the search bar and tab - use normal grey
    "ntp_text": [ 255, 255, 255 ], --> leave as is
    "omnibox_background": [ 50, 50, 255 ], --> background of search bar - use dark grey
    "omnibox_text": [ 255, 255, 255 ], --> leave as is
    "tab_background_text": [ 189, 193, 198 ], --> change to white
    "tab_background_text_inactive": [ 168, 171, 175 ], --> change to light grey
    "tab_text": [ 241, 243, 244 ], --> change to white
    "toolbar": [ 50, 54, 57 ] --> the color of the bar around the search bar and tab - use normal grey

# Reference `manifest.json`

{
   "description": "A fork of https://github.com/Fiddle-N/material-incognito-dark-theme/ with my own colors.",
   "icons": {
      "128": "images/icon128.png"
   },
   "key": "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjkphcEoIidwZEL+9YVV/M/dx5XgY6jDOAVQwC9fRdNuboPe4+CC4znYzO5Qg5M+ozxNzOHcVRrMGM7sjvImaNIVWUT9WyquKmZvsqSBO8B4Ob4KKm8QTQpLGqZgZGUnABwtk4U4jut+zQBNpwow6EkOL+3JRu/61bNzb9rYJAVzCkdOFILaa14pPvUgtzHWeCTtJav7U4Qdtqukap45UlqSz7P/WZQ8NdMmlJbQKv/bSuY6rRsfxYtPsDVXyb0ngPIIfsPSU8z8Tw8Wsw3EVFpjhtcpASMrYgvtUTvWxozIq9IrKPSiakTaWHCFQVRn382FqUwzMDG4JJuA4VnNZNQIDAQAB",
   "manifest_version": 2,
   "name": "Grey Theme",
   "theme": {
      "colors": {
         "bookmark_text": [ 241, 243, 244 ],
         "frame": [ 32, 33, 36 ],
         "frame_inactive": [ 60, 64, 67 ],
         "ntp_background": [ 50, 54, 57 ],
         "ntp_text": [ 255, 255, 255 ],
         "omnibox_background": [ 50, 50, 255 ],
         "omnibox_text": [ 255, 255, 255 ],
         "tab_background_text": [ 189, 193, 198 ],
         "tab_background_text_inactive": [ 168, 171, 175 ],
         "tab_text": [ 241, 243, 244 ],
         "toolbar": [ 50, 54, 57 ]
      },
      "images": {
         "theme_ntp_background": "images/material_refresh_grey.png",
         "theme_toolbar": "images/material_refresh_grey.png"
      },
      "properties": {
         "ntp_background_repeat": "repeat",
         "ntp_logo_alternate": 1
      },
      "tints": {
         "buttons": [ -1, -1, 1 ]
      }
   },
   "update_url": "https://clients2.google.com/service/update2/crx",
   "version": "5.2.0"
}
