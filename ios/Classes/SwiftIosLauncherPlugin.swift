import Flutter
import UIKit

public class SwiftIosUrlLauncherPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "ios_url_launcher", binaryMessenger: registrar.messenger())
    let instance = SwiftIosUrlLauncherPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }
    func launchUrl(_ url: String) {
            if let url = URL(string: url) {
                if  UIApplication.shared.canOpenURL(url){
                    UIApplication.shared.open(url)
                }
            }
    }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      if call.method == "launchUrl" {
          let args = call.arguments
          if args is String {
              let url: String = args as! String
              launchUrl(url)
          }
         else if args is Array<String> {
              let args: Array<String> = args as! Array<String>
             if args.isEmpty {
                 return
             }
             let url = args.first!
              launchUrl(url)
          }
        result("iOS Launch Success")
      }
  }
}
