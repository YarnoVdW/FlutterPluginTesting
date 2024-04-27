import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flight_platform_interface.dart';

class MethodChannelFlight extends FlightPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('flight');

  @override
  Future<void> turnFlashOn() async {
    await methodChannel.invokeMethod<String>('turnFlashOn');
  }

  @override
  Future<String> authenticate() async {
    try {
      final String result = await methodChannel.invokeMethod('authenticate');
      return result;
    } on PlatformException catch (e) {
      return "Failed to authenticate: '${e.message}'.";
    }
  }
}
