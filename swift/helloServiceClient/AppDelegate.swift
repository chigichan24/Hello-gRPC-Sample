import LineSDK
import Swinject
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        LoginManager.shared.setup(channelID: "CHANNEL_ID", universalLinkURL: nil)

        return true
    }

    func application(_ app: UIApplication, open url: URL, options _: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return LoginManager.shared.application(app, open: url)
    }
}
