# Carbun

The idea is to educate the people on the cause of climate change by letting them know about the amount of carbon they emit in their daily life. We made a carbon calculator which suggests the approx amount of carbon exposed to our nature from Railways, Cars, Metros, and Airplanes. Once identifying carbon in KG we suggest the number of trees is planted. 
We made a credit-based system to reinforce our clients to plant more trees and earning more credits. The reward is associated after gaining x amount of credits.

## Installation

Use the package manager [npm](https://nodejs.org/dist/v14.16.0/node-v14.16.0-linux-x64.tar.xz) to install node packages.

```bash
node server.js
```

## Usage

```node
const express = require('express');
const bodyParser = require("body-parser");
var path = require('path');
const app = express();
const port = 8080;

app.post('/car', function (req, res) {
	var petrol = req.body.petrol
	console.log(petrol);
	var lit_gal = petrol * 0.264172;
	console.log(lit_gal);
	var co2_in_pounds = lit_gal * 19.50
	console.log(co2_in_pounds);
	var final_in_kg = co2_in_pounds * 0.453592
	console.log(final_in_kg);
	res.json({'carbon': final_in_kg});

})
```
## Website
Check out our website [here](https://crackdcode.000webhostapp.com/
)

![](https://cdn.discordapp.com/attachments/820163697083285556/820641972418117712/Home_Page.jpg)

## Android App

![Screenshot_1615727355](https://user-images.githubusercontent.com/29622334/111070003-b399ff00-84f5-11eb-9e07-8d8827bee70e.png)

![Screenshot_1615726704](https://user-images.githubusercontent.com/29622334/111070029-d0363700-84f5-11eb-8bc5-a57ba0bbb79f.png)

![Screenshot_1615726709](https://user-images.githubusercontent.com/29622334/111070061-efcd5f80-84f5-11eb-8a6f-0ae1a3567c79.png)

![Screenshot_1615727320](https://user-images.githubusercontent.com/29622334/111070123-24411b80-84f6-11eb-9cd4-4451629f47a5.png)

![Screenshot_1615727331](https://user-images.githubusercontent.com/29622334/111070131-30c57400-84f6-11eb-9546-00f685a4a5a7.png)

![Screenshot_1615727346](https://user-images.githubusercontent.com/29622334/111070156-3f139000-84f6-11eb-89a5-a485d7aa425f.png)

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)