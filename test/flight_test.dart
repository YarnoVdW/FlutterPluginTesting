import 'package:flutter_test/flutter_test.dart';
import 'package:flight/flight.dart';
import 'package:flight/flight_platform_interface.dart';
import 'package:flight/flight_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlightPlatform
    with MockPlatformInterfaceMixin
    implements FlightPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> turnFlashOn() => Future.value();


}

void main() {
  final FlightPlatform initialPlatform = FlightPlatform.instance;

  test('$MethodChannelFlight is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlight>());
  });

  test('getPlatformVersion', () async {
    Flight flightPlugin = Flight();
    MockFlightPlatform fakePlatform = MockFlightPlatform();
    FlightPlatform.instance = fakePlatform;

    expect(await flightPlugin.getPlatformVersion(), '42');
  });
}
