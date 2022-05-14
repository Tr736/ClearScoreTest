import UIKit
struct Score {
    var min: CGFloat
    var max: CGFloat
    var actual: CGFloat

    init(min: CGFloat = 0,
         max: CGFloat = 1,
         actual: CGFloat = 0) {
        self.min = min
        self.max = max
        self.actual = actual
    }
}
