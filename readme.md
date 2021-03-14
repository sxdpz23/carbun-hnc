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

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)