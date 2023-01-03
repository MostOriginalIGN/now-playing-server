# now-playing-server

For [minimalistic-desktop](https://github.com/Astrogamer54/minimalistic-desktop)

Hosts on http://127.0.0.1:8975/

![JSON EXAMPLE](https://user-images.githubusercontent.com/78519393/210159888-bf400d7c-97ad-4f2e-9a4e-262f406e4459.png)

![CONSOLE](https://user-images.githubusercontent.com/78519393/210159926-e289ad56-dabe-4670-aee0-164d6c0efc01.png)

**!! REQUIRES [`WEBNOWPLAYING`](https://chrome.google.com/webstore/detail/webnowplaying-companion/jfakgfcdgpghbbefmdfjkbdlibjgnbli?hl=en-US) OR SPOTIFY NOW PLAYING WITH SPICETIFY !!**

# Install

## Windows
Open Powershell and paste the following command:

`iwr -useb https://raw.githubusercontent.com/Astrogamer54/now-playing-server/master/install.ps1 | iex`

# Spicetify Setup

 - ## Windows
	**1. Open Powershell and paste the following commands:**
	``` 
	iwr -useb https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.ps1 | iex
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
