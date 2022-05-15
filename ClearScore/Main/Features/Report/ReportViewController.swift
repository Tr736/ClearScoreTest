import UIKit

final class ReportViewController: UIViewController {
    private let reportView = ReportView()
    
    override func loadView() {
        view = reportView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewController()
    }

    init(viewModel: DashboardViewModel) {
        super.init(nibName: nil, bundle: nil)
        title = .reportTitle
        tabBarItem.image = .report
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepareViewController() {
    }
}
