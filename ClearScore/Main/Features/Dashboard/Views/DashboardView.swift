import UIKit

final class DashboardView: UIView {
    private enum Constants {
        static let accessibilityLabel = "DashboardViewController"
        static let scoreViewSize: CGFloat = 200
    }

    private lazy var scoreView: ScoreView = {
        let view = ScoreView(frame: CGRect.zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
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

        prepareScoreView()
    }

    private func prepareScoreView() {
        guard scoreView.superview == nil else { return }
        addSubview(scoreView)
        NSLayoutConstraint.activate([
            scoreView.centerXAnchor.constraint(equalTo: centerXAnchor),
            scoreView.centerYAnchor.constraint(equalTo: centerYAnchor),
            scoreView.heightAnchor.constraint(equalToConstant: Constants.scoreViewSize),
            scoreView.widthAnchor.constraint(equalToConstant: Constants.scoreViewSize)
        ])
    }

    func update(score: Score) {
        scoreView.updateProgress(actual: score.actual,
                                 max: score.max)
    }

}
