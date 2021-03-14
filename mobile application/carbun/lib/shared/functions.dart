class CalculatorFunctions {
  double calculateForCar({int fuel}) {
    double litToGallon = fuel * 0.264172;
    double co2InPounds = litToGallon * 19.50;
    double result = co2InPounds * 0.453592;
    return result;
  }

  double calculateForPlane({int distance}) {
    double kmMiles = distance * 0.621371;
    double co2InPounds = kmMiles * 0.55;
    double result = co2InPounds * 0.453592;
    return result;
  }
}
