import UIKit

public protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var rootViewController: UIViewController { get set }

    func start()
}
