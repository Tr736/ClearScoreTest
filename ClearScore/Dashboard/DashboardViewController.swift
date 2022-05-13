import UIKit

final class DashboardViewController: UIViewController {
    private enum Constants {
        static let navigationBarAccessibilityLabel = "DashboardNavViewController"
    }

    private var viewModel: DashboardViewModel

    init(viewModel: DashboardViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = DashboardView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewController()
    }

    private func prepareViewController() {
        navigationController?.navigationBar.accessibilityLabel = Constants.navigationBarAccessibilityLabel
        title = LocalizedConstants.dashboardTitle
    }
}
