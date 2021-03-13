const express = require('express');
const bodyParser = require("body-parser");
var path = require('path');
const app = express();
const port = 8080;
app.use(bodyParser.urlencoded({ extended: true })); 

app.get('/', function(req,res){
	 res.sendFile(path.join(__dirname+'/form.html'));
});

app.post('/car', function (req, res) {
	var petrol = req.body.petrol
	console.log(petrol);
	var lit_gal = petrol * 0.264172;
	console.log(lit_gal);
	var co2_in_pounds = lit_gal * 19.50
	console.log(co2_in_pounds);
	var final_in_kg = co2_in_pounds * 0.453592
	console.log(final_in_kg);

})

app.post('/plane', function (req, res) {
	var plane = req.body.plane
	console.log(plane);
	var km_miles = plane * 0.621371;
	console.log(km_miles);
	var co2_in_pounds = km_miles * 0.55
	console.log(co2_in_pounds);
	var final_in_kg = co2_in_pounds * 0.453592
	console.log(final_in_kg);

})

app.post('/train', function (req, res) {
	var train = req.body.train
	console.log(train);
	var km_miles = train * 0.621371;
	console.log(km_miles);
	var co2_in_pounds = km_miles * 0.30
	console.log(co2_in_pounds);
	var final_in_kg = co2_in_pounds * 0.453592
	console.log(final_in_kg);

})

app.post('/metro', function (req, res) {
	var metro = req.body.metro
	console.log(metro);
	var km_miles = metro * 0.621371;
	console.log(km_miles);
	var co2_in_pounds = km_miles * 0.25
	console.log(co2_in_pounds);
	var final_in_kg = co2_in_pounds * 0.453592
	console.log(final_in_kg);

})
app.listen(port, () => console.log(`Example app listening on port ${port}!`))
