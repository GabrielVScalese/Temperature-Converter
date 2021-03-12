class TemperatureConverter {
  static double celsiusToKelvin(double celsius) {
    return celsius + 273.15;
  }

  static double celsiusToFahrenheit(double celsius) {
    return ((9 / 5.0) * celsius) + 32;
  }

  static double kelvinToCelsius(double kelvin) {
    return kelvin - 273.15;
  }

  static double kelvinToFahrenheint(double kelvin) {
    return (kelvin - 273.15) * 9 / 5.0 + 32.0;
  }

  static double fahrenheitToCelsius(double fahrenheit) {
    return (fahrenheit - 32.0) * 5 / 9.0;
  }

  static double fahrenheitToKelvin(double fahrenheit) {
    return (fahrenheit - 32) * 5 / 9.0 + 273.15;
  }
}
