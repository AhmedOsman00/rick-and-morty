import UIKit
import Characters

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }

    container.register()
    let mainViewController: CharactersViewController = container.resolved()
    window = UIWindow(windowScene: windowScene)
    window?.rootViewController = UINavigationController(rootViewController: mainViewController)
    window?.makeKeyAndVisible()
  }
}

