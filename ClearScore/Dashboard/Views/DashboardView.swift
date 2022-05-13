import UIKit
final class DashboardView: UIView {
    private enum Constants {
        static let accessibilityLabel = "DashboardViewController"
    }
    private lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        prepareTitleLabel()
    }

    private func prepareTitleLabel() {
        guard titleLabel.superview == nil else { return }
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor),
            titleLabel.topAnchor.constraint(
                equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(
                equalTo: bottomAnchor)
        ])
    }
}
