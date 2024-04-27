import 'flight_platform_interface.dart';

class Flight {
  Future<void> turnFlashOn() async {
    FlightPlatform.instance.turnFlashOn();
  }

  Future<String> authenticate() async {
    return FlightPlatform.instance.authenticate();
  }
}
