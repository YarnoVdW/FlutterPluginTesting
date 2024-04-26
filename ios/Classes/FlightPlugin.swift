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
        result(toggleFlash(on: false))
    default:
      result(FlutterMethodNotImplemented)
    }
  }
    
    func toggleFlash(on: Bool ) {
            guard let device = AVCaptureDevice.default(for: .video), device.hasTorch else { return }
            
            do {
                try device.lockForConfiguration()
                
                device.torchMode = on ? .on : .off
                if on {
                    try device.setTorchModeOn(level: AVCaptureDevice.maxAvailableTorchLevel)
                }
                
                device.unlockForConfiguration()
            } catch {
                print("Error: \(error)")
            }
        }
}
