import UIKit

struct AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var rootViewController: UIViewController
    private var api: APIType

    init(rootViewController: UITabBarController,
         api: APIType) {
        self.rootViewController = rootViewController
        self.api = api
    }

    func start() {
        let viewModel = DashboardViewModel(api: api,
                                           coordinator: self)
        let dashboardVC = DashboardViewController(viewModel: viewModel)
        let reportVC = ReportViewController(viewModel: viewModel)
        if let rootVC = rootViewController as? SlidingTabBarController {
            rootVC.viewControllers = [dashboardVC, reportVC]
        }
    }

    func showReport() {
        if let rootVC = rootViewController as? SlidingTabBarController, let viewControllers = rootVC.viewControllers {
            _ = rootVC.tabBarController(rootVC, shouldSelect: viewControllers[1])
            rootVC.selectedIndex = 1
        }
    }

    func showDashboard() {
        if let rootVC = rootViewController as? SlidingTabBarController {
            rootVC.selectedIndex = 0
        }
    }
}
