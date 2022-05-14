import UIKit

final class DashboardView: UIView {
    private enum Constants {
        static let accessibilityLabel = "DashboardViewController"
        static let scoreViewSize: CGFloat = 220
        static let topPadding: CGFloat = 80
    }
    private lazy var backgroundImageView: UIImageView = {
        let view = UIImageView(image: UIImage.background)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .topLeft
        return view
    }()

    private lazy var scoreView: ScoreView = {
        let view = ScoreView(title: LocalizedConstants.scoreViewTitle,
                             subtitle: LocalizedConstants.scoreViewSubTitle)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.cornerRadius = Constants.scoreViewSize / 2
        view.clipsToBounds = true
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func prepareView() {
        backgroundColor = .white
        accessibilityLabel = Constants.accessibilityLabel
        prepareBackgroundView()
        prepareScoreView()
    }

    private func prepareBackgroundView() {
        guard backgroundImageView.superview == nil else { return }
        addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func prepareScoreView() {
        guard scoreView.superview == nil else { return }
        addSubview(scoreView)
        NSLayoutConstraint.activate([
            scoreView.topAnchor.constraint(equalTo: topAnchor,
                                           constant: Constants.topPadding),
            scoreView.centerXAnchor.constraint(equalTo: centerXAnchor),
            scoreView.heightAnchor.constraint(equalToConstant: Constants.scoreViewSize),
            scoreView.widthAnchor.constraint(equalToConstant: Constants.scoreViewSize)
        ])
    }

    func update(score: Score) {
        scoreView.updateScore(actual: score.actual,
                                 max: score.max)
    }

    func showRefreshButton(target: Any, selector: Selector) {
        scoreView.showRefreshButton(target: target, selector: selector)
    }
}
