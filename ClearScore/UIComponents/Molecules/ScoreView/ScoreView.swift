import UIKit

final class ScoreView: UIView {
    private enum Constants {
        static let padding: CGFloat = 36
        static let spacing: CGFloat = 8
    }

    private lazy var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
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
        return label
    }()

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 48)
        label.textColor = .white
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

    convenience init(title: String, subtitle: String) {
        self.init(frame: CGRect.zero)
        prepareView()
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }

    private func prepareView() {
        prepareBlurView()
        prepareCircularView()
        prepareStackView()
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

    func updateScore(actual: CGFloat, max: CGFloat) {
        circularProgressView.updateProgress(actual: actual,
                                            max: max)
        scoreLabel.text = String(describing: actual)
        if let subtitle = subtitleLabel.text {
            subtitleLabel.text = subtitle + " \(max)"
        }

        if verticalStackView.alpha == 0 {
            UIView.animate(withDuration: 0.23) {
                self.verticalStackView.alpha = 1
            }
        }
    }
}
