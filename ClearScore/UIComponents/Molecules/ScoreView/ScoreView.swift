import UIKit

final class ScoreView: UIView {
    private enum Constants {
        static let padding: CGFloat = 36
        static let spacing: CGFloat = 8
        static let buttonSize: CGFloat = 60
        static let accessibilityLabel = "scoreView"
        static let blurViewAccessibilityLabel = "blurView"
        static let titleLabelAccessibilityLabel = "titleLabel"
        static let subtitleLabelAccessibilityLabel = "subtitleLabel"
        static let scoreLabelAccessibilityLabel = "scoreLabel"
    }

    private lazy var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.accessibilityLabel = Constants.blurViewAccessibilityLabel
        return blurEffectView
    }()

    private lazy var circularProgressView: CircularProgressView = {
        let view = CircularProgressView(frame: CGRect.zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.accessibilityLabel = Constants.titleLabelAccessibilityLabel
        return label
    }()

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.accessibilityLabel = Constants.subtitleLabelAccessibilityLabel
        return label
    }()

    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 48)
        label.textColor = .white
        label.accessibilityLabel = Constants.scoreLabelAccessibilityLabel
        return label
    }()

    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel,
                                                       scoreLabel,
                                                       subtitleLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.alpha = 0
        stackView.spacing = Constants.spacing
        return stackView
    }()

    private lazy var refreshButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage.refreshImage, for: .normal)
        button.tintColor = .white
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()

    convenience init(title: String, subtitle: String) {
        self.init(frame: CGRect.zero)
        prepareView()
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }

    private func prepareView() {
        accessibilityLabel = Constants.accessibilityLabel
        prepareBlurView()
        prepareCircularView()
    }

    private func prepareBlurView() {
        guard blurView.superview == nil else { return }
        addSubview(blurView)
        NSLayoutConstraint.activate([
            blurView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurView.topAnchor.constraint(equalTo: topAnchor),
            blurView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func prepareCircularView() {
        guard circularProgressView.superview == nil else { return }
        addSubview(circularProgressView)
        NSLayoutConstraint.activate([
            circularProgressView.leadingAnchor.constraint(equalTo: leadingAnchor),
            circularProgressView.topAnchor.constraint(equalTo: topAnchor),
            circularProgressView.trailingAnchor.constraint(equalTo: trailingAnchor),
            circularProgressView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func prepareStackView() {
        guard verticalStackView.superview == nil else { return }
        addSubview(verticalStackView)
        addConstraints([
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                       constant: Constants.padding),
            verticalStackView.topAnchor.constraint(greaterThanOrEqualTo: topAnchor,
                                                   constant: Constants.padding),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                        constant: -Constants.padding),
            verticalStackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -Constants.padding),
            verticalStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            verticalStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    private func prepareRefreshButton() {
        guard refreshButton.superview == nil else { return }
        addSubview(refreshButton)
        NSLayoutConstraint.activate([
            refreshButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            refreshButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            refreshButton.widthAnchor.constraint(equalToConstant: Constants.buttonSize),
            refreshButton.heightAnchor.constraint(equalToConstant: Constants.buttonSize)
        ])
    }

    func updateScore(actual: CGFloat, max: CGFloat) {
        if refreshButton.superview != nil {
            refreshButton.removeFromSuperview()
        }

        circularProgressView.updateProgress(actual: actual,
                                            max: max)
        scoreLabel.text = String(describing: actual)
        if let subtitle = subtitleLabel.text {
            subtitleLabel.text = subtitle + " \(max)"
        }
        prepareStackView()

        if verticalStackView.alpha == 0 {
            UIView.animate(withDuration: 0.23) {
                self.verticalStackView.alpha = 1
            }
        }
    }

    func showRefreshButton(target: Any, selector: Selector) {
        if verticalStackView.superview != nil {
            verticalStackView.removeFromSuperview()
        }
        prepareRefreshButton()
        refreshButton.isEnabled = true
        refreshButton.addTarget(target, action: selector, for: .touchUpInside)
    }
}
