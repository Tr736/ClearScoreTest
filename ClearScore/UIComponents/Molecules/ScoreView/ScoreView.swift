import UIKit

final class ScoreView: UIView {
    private lazy var circularProgressView: CircularProgressView = {
        let view = CircularProgressView(frame: CGRect.zero)
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
        prepareCircularView()
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

    func updateProgress(actual: CGFloat, max: CGFloat) {
        circularProgressView.updateProgress(actual: actual,
                                            max: max)
    }
}
