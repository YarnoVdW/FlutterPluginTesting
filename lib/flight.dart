
import 'flight_platform_interface.dart';

class Flight {
  Future<String?> getPlatformVersion() {
    return FlightPlatform.instance.getPlatformVersion();
  }

  Future<void> turnFlashOn() async {
    FlightPlatform.instance.turnFlashOn();
  }

}
