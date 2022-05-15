import UIKit
import Combine
final class DashboardViewController: UIViewController {

    private let dashboardView = DashboardView()
    private var viewModel: DashboardViewModel
    private var cancellable: [AnyCancellable] = []

    init(viewModel: DashboardViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = .dashboardTitle
        tabBarItem.image = .dashboard
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = dashboardView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        retryObserver()
        scoreObserver()
        viewModel.fetchDashboardData()
    }

    private func retryObserver() {
        viewModel.shouldRetryFetch.sink { [weak self] shouldRetry in
            guard let self = self else { return }
            if shouldRetry == true {
                DispatchQueue.main.async {
                    self.dashboardView.showRefreshButton(target: self,
                                                         selector: #selector(self.retryButtonTapped(_:)))
                }
            }
        }.store(in: &cancellable)

    }

    private func scoreObserver() {
        viewModel.$score.sink { [weak self] score in
            guard let self = self else { return }
            if let score = score {
                DispatchQueue.main.async {
                    self.dashboardView.update(score: score)
                    self.dashboardView.addTapGestureToScoreView(target: self,
                                                                selector: #selector(self.scoreViewTapped(_:)))
                }
            }
        }.store(in: &cancellable)
    }

    @objc func retryButtonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        viewModel.fetchDashboardData()
    }

    @objc func scoreViewTapped(_ sender: UIGestureRecognizer) {
        viewModel.showReport()
    }
}
