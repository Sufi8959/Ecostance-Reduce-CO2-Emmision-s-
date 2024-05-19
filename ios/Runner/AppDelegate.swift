import UIKit
import Flutter
import GoogleMaps
import flutter_downloader


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      GMSServices.provideAPIKey("AIzaSyBH35iPxDd6qTjp5PPQJu5ZskE6x1YLOFw")
      GeneratedPluginRegistrant.register(with: self)
    FlutterDownloaderPlugin.setPluginRegistrantCallback(registerPlugins)
      
      


      if #available(iOS 10.0, *) {
        UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
      }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

private func registerPlugins(registry: FlutterPluginRegistry) {
    if (!registry.hasPlugin("FlutterDownloaderPlugin")) {
       FlutterDownloaderPlugin.register(with: registry.registrar(forPlugin: "FlutterDownloaderPlugin")!)
    }
}



// class BaseENV {
//     let dict: NSDictionary
//   init ( resourceName : String ) {
//     guard let filePath = Bundle.main.path(forResource: resourceName , ofType : "plist" ) , let plist = NSDictionary(contentsOfFile:filePath)
//         else {
//       fatalError ( " Couldn't find file '\(resourceName)' plist " )
//     }
//       self.dict=plist
//   }
// }

// protocol APIKeyble{
//     var GOOGLE_MAP_API_KEY: String { get }
// }

// class DebugENV : BaseENV, APIKeyble{
 
    
//     init(){
//         super.init(resourceName: "DEBUG_KEYS")
//     }
    
//     var GOOGLE_MAP_API_KEY: String{
//         dict.object(forKey: "GOOGLE_MAP_API_KEY") as? String ?? ""
//     }
// }

// class ProdENV : BaseENV,APIKeyble{
//     init(){
//         super.init(resourceName: "PROD_ENV")
//     }
//     var GOOGLE_MAP_API_KEY: String{
//         dict.object(forKey: "GOOGLE_MAP_API_KEY") as? String ?? ""
//     }
// }


// var ENV:APIKeyble {
//   #if DEBUG
//   return DebugENV()
//   #else
//   return ProdENV()
//   #endif
// }
