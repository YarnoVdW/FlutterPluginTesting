import Flutter
import UIKit
import AVFoundation
import LocalAuthentication


public class FlightPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flight", binaryMessenger: registrar.messenger())
    let instance = FlightPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "turnFlashOn":
        result(toggleFlash())
        
    case "authenticate":
        authenticate(result: result)
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
    
    
    func authenticate(result: @escaping FlutterResult) {
            let context = LAContext()
            var error: NSError?

            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Authenticate to access your data"
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                    if success {
                        result("Authenticated successfully")
                    } else {
                        if let error = error as? LAError {
                            switch error.code {
                            case .authenticationFailed:
                                result("Authentication failed")
                            case .userCancel:
                                result("User cancelled authentication")
                            case .biometryLockout:
                                result("Biometry locked out")
                            default:
                                result("Authentication failed")
                            }
                        }
                    }
                }
            } else {
                result("Biometric authentication not available")
            }
        }
    
}
