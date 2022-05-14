import UIKit

final class CircularProgressView: UIView {
    private enum Constants {
        static let accessibilityLabel = "CircularProgressView"
        static let circleRadius: CGFloat = 100
        static let circleRadiusWidth: CGFloat = 2 * Constants.circleRadius
        static let circleRadiusHeight: CGFloat = 2 * Constants.circleRadius
        static let rotationAngle: CGFloat = -90
    }

   private var progress: CGFloat {
      get {
        return circlePathLayer.strokeEnd
      }
      set {
        if newValue > 1 {
          circlePathLayer.strokeEnd = 1
        } else if newValue < 0 {
          circlePathLayer.strokeEnd = 0
        } else {
          circlePathLayer.strokeEnd = newValue
        }
      }
    }

    private var circlePath:  UIBezierPath {
      return UIBezierPath(ovalIn: circleFrame())
    }

    private lazy var circlePathLayer: CAShapeLayer = {
        let circlePathLayer = CAShapeLayer()
        circlePathLayer.frame = bounds
        circlePathLayer.lineWidth = 8
        circlePathLayer.fillColor = UIColor.clear.cgColor
        circlePathLayer.strokeColor = UIColor.red.cgColor
        circlePathLayer.lineCap = .round
        return circlePathLayer
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareView()
        // Apple treats 3pm as 0 degrees. We should rotate it so the stroke starts from 12pm.
        transform = CGAffineTransform(rotationAngle: Constants.rotationAngle * Double.pi/180);

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        circlePathLayer.frame = bounds
        circlePathLayer.path = circlePath.cgPath
        progress = 0
    }

    private func prepareView() {
        accessibilityLabel = Constants.accessibilityLabel
        prepareCirclePathLayer()
    }

    private func prepareCirclePathLayer() {
        guard circlePathLayer.superlayer == nil else { return }
        layer.addSublayer(circlePathLayer)
    }

    // Keep seperated - we will need to redraw whenever the parent bounds change
    private func circleFrame() -> CGRect {
        var circleFrame = CGRect(x: 0,
                                 y: 0,
                                 width: Constants.circleRadiusWidth,
                                 height: Constants.circleRadiusHeight)
        let circlePathBounds = circlePathLayer.bounds
        circleFrame.origin.x = circlePathBounds.midX - circleFrame.midX
        circleFrame.origin.y = circlePathBounds.midY - circleFrame.midY
        return circleFrame
    }

    func updateProgress(actual: CGFloat, max: CGFloat) {
        progress = actual / max
    }
}
