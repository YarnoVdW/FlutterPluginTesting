import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flight_method_channel.dart';

abstract class FlightPlatform extends PlatformInterface {
  FlightPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlightPlatform _instance = MethodChannelFlight();

  static FlightPlatform get instance => _instance;

  static set instance(FlightPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> turnFlashOn() {
    throw UnimplementedError('turnFlashOn() has not been implemented.');
  }

  Future<String> authenticate() {
    throw UnimplementedError('getPlatformVersion() has not been implemented.');
  }
}
