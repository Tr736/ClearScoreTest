import Foundation
@testable import ClearScore
import UIKit
struct MockCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []

    var rootViewController: UIViewController

    init(rootViewController: UIViewController = UIViewController()) {
        self.rootViewController = rootViewController
    }

    func start() {

    }
}
