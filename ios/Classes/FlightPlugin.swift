import Flutter
import UIKit
import AVFoundation


public class FlightPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flight", binaryMessenger: registrar.messenger())
    let instance = FlightPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "turnFlashOn":
        result(toggleFlash())
    default:
      result(FlutterMethodNotImplemented)
    }
  }
    
    func toggleFlash() {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return }
            guard device.hasTorch else { return }

            do {
                try device.lockForConfiguration()

                if (device.torchMode == AVCaptureDevice.TorchMode.on) {
                    device.torchMode = AVCaptureDevice.TorchMode.off
                } else {
                    do {
                        try device.setTorchModeOn(level: 0.5)
                    } catch {
                        print(error)
                    }
                }

                device.unlockForConfiguration()
            } catch {
                print(error)
            }
        }
    
}
