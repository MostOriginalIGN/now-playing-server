# now-playing-server

**!! REQUIRES [`WEBNOWPLAYING`](https://chrome.google.com/webstore/detail/webnowplaying-companion/jfakgfcdgpghbbefmdfjkbdlibjgnbli?hl=en-US) OR SPOTIFY NOW PLAYING WITH SPICETIFY !!**

# Spicetify Setup



 - ## Windows
	**1. Open Powershell and paste the following commands:**
	``` 
	Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.ps1" | Invoke-Expression
	spicetify
	spicetify config extensions webnowplaying.js
	```
	
	**If aren't using Spicetify for theming, run the following command**

	`spicetify config inject_css 0 replace_colors 0`

	**2. Save and apply all changes:**

	`spicetify backup apply`
	
- ## Linux/Mac
	**1. Open Terminal and paste the following commands:**
	``` 
	curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.sh | sh
	spicetify
	spicetify config extensions webnowplaying.js
	```
	
	**If aren't using Spicetify for theming, run the following command**

	`spicetify config inject_css 0 replace_colors 0`

	**2. Save and apply all changes:**

	`spicetify backup apply`
