import UIKit
struct AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = DashboardViewController()
        navigationController.pushViewController(viewController,
                                                animated: false)
    }
}
