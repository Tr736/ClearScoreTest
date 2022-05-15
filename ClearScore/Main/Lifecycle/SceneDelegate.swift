
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    private var appCoordinator: AppCoordinator?

    private lazy var rootViewController: SlidingTabBarController = {
        let viewController = SlidingTabBarController()
        viewController.tabBar.tintColor = .selectedTintColor
        viewController.tabBar.unselectedItemTintColor = .darkGray
        return viewController
    }()

    var window: UIWindow?
    func scene(_ scene: UIScene,
               willConnectTo
               session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        let api = ConcreteAPI(urlSession: URLSession.shared)
        appCoordinator = AppCoordinator(rootViewController: rootViewController,
                                    api: api)
        appCoordinator?.start()
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}

