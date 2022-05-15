import UIKit

final class ReportViewController: UIViewController {
    private let reportView = ReportView()
    private let viewModel: DashboardViewModel

    override func loadView() {
        view = reportView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    init(viewModel: DashboardViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = .reportTitle
        tabBarItem.image = .report
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
