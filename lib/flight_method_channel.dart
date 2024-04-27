import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flight_platform_interface.dart';

/// An implementation of [FlightPlatform] that uses method channels.
class MethodChannelFlight extends FlightPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flight');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> turnFlashOn() async {
    await methodChannel.invokeMethod<String>('turnFlashOn');
  }

}
