import UIKit
import Combine
final class DashboardViewController: UIViewController {
    private enum Constants {
        static let navigationBarAccessibilityLabel = "DashboardNavViewController"
    }
    private let dashboardView = DashboardView()
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
        view = dashboardView
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
        viewModel.shouldRetryFetch.sink { [weak self] shouldRetry in
            guard let self = self else { return }
            if shouldRetry == true {
                DispatchQueue.main.async {
                    self.dashboardView.showRefreshButton(target: self,
                                                         selector: #selector(self.retryButtonTapped(_:)))
                }
            }
        }.store(in: &cancellable)

        viewModel.$score.sink { [weak self] score in
            guard let self = self else { return }
            if let score = score {
                DispatchQueue.main.async {
                    self.dashboardView.update(score: score)
                }
            }
        }.store(in: &cancellable)
    }

    @objc func retryButtonTapped(_ sender: UIButton) {
        sender.isEnabled = !sender.isEnabled
        viewModel.fetchDashboardData()
    }
}
