import UIKit

final class DashboardViewController: UIViewController {
    override func loadView() {
        self.view = DashboardView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewController()
    }

    private func prepareViewController() {
        title = NSLocalizedString("Dashboard",
                                  comment: "Dashboard Navigation Bar title")
    }
}
