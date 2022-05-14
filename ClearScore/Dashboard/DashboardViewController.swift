import UIKit
import Combine
final class DashboardViewController: UIViewController {
    private enum Constants {
        static let navigationBarAccessibilityLabel = "DashboardNavViewController"
    }

    private var viewModel: DashboardViewModel
    private var cancellable: [AnyCancellable] = []
    
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
        observers()
        prepareViewController()
        
        viewModel.fetchDashboardData()
    }

    private func prepareViewController() {
        navigationController?.navigationBar.accessibilityLabel = Constants.navigationBarAccessibilityLabel
        title = LocalizedConstants.dashboardTitle
    }


    private func observers() {
        self.viewModel.shouldRetryFetch.sink { shouldRetry in
            if shouldRetry == true {

            }
        }.store(in: &cancellable)
    }
}
