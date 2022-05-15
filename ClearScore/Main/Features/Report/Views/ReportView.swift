import UIKit
final class ReportView: UIView {
    private enum Constants {
        static let accessibilityLabel = "ReportView"
    }
    private lazy var backgroundImageView: UIImageView = {
        let view = UIImageView(image: UIImage.background)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .top
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
        accessibilityLabel = Constants.accessibilityLabel
        prepareBackgroundView()
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
}
