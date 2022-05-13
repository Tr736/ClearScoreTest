import UIKit
struct AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    private var api: APIType
    init(navigationController: UINavigationController,
         api: APIType) {
        self.navigationController = navigationController
        self.api = api
    }

    func start() {
        let viewModel = DashboardViewModel(api: self.api)
        let viewController = DashboardViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController,
                                                animated: false)
    }
}
