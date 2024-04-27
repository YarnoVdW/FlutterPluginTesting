import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flight_method_channel.dart';

abstract class FlightPlatform extends PlatformInterface {
  /// Constructs a FlightPlatform.
  FlightPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlightPlatform _instance = MethodChannelFlight();

  /// The default instance of [FlightPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlight].
  static FlightPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlightPlatform] when
  /// they register themselves.
  static set instance(FlightPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> turnFlashOn() {
    throw UnimplementedError('turnFlashOn() has not been implemented.');
  }

}
