import UIKit

final class SlidingTabBarController: UITabBarController {
    private enum Constants {
        static let accessibilityLabel = "blurTabbarcontroller"

    }
    private lazy var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .prominent)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.accessibilityLabel = Constants.accessibilityLabel
        blurEffectView.alpha = 0.9
        return blurEffectView
    }()

    private lazy var leftSwipe: UISwipeGestureRecognizer = {
        let gesture = UISwipeGestureRecognizer()
        gesture.addTarget(self, action: #selector(handle(gesture:)))
        gesture.direction = .left
        return gesture
    }()

    private lazy var rightSwipe: UISwipeGestureRecognizer = {
        let gesture = UISwipeGestureRecognizer()
        gesture.addTarget(self, action: #selector(handle(gesture:)))
        gesture.direction = .right
        return gesture
    }()

    
    override func viewDidLoad() {
       super.viewDidLoad()
        delegate = self
        addSwipeGestures()
        prepareBlurView()
     }

    private func addSwipeGestures() {
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
    }

    private func prepareBlurView() {
        guard blurView.superview == nil else { return }
        tabBar.addSubview(blurView)
        tabBar.sendSubviewToBack(blurView)
        NSLayoutConstraint.activate([
            blurView.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            blurView.topAnchor.constraint(equalTo: tabBar.topAnchor),
            blurView.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor)
        ])
    }

    @objc private func handle(gesture: UISwipeGestureRecognizer) {
        if (gesture.direction == .left) {
            goToNext()
         } else if gesture.direction == .right {
            goToPrevious()
         }
    }

    private func goToPrevious() {
        let newIndex = selectedIndex - 1
        guard newIndex >= 0,
        let viewControllers = self.viewControllers else { return }
        _ = tabBarController(self, shouldSelect: viewControllers[newIndex])
        selectedIndex = newIndex
    }

    private func goToNext() {
        let newIndex = selectedIndex + 1
        guard let viewControllers = self.viewControllers,
              newIndex < viewControllers.count else { return }
        _ = tabBarController(self, shouldSelect: viewControllers[newIndex])
        selectedIndex = newIndex

    }
}

extension SlidingTabBarController: UITabBarControllerDelegate  {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {

        guard let fromView = selectedViewController?.view,
              let toView = viewController.view else {
          return false // Prevent multiple taps
        }

        if fromView != toView {
          UIView.transition(from: fromView, to: toView, duration: 0.3, options: [.transitionCrossDissolve], completion: nil)
        }

        return true
    }
}
