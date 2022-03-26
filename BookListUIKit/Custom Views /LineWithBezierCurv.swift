import UIKit

final class LineWithBezierCurv: UIView {
    override func draw(_ rect: CGRect) {
        let aPath = UIBezierPath()
        aPath.move(to: CGPoint(x: .min, y: 20))
        aPath.addLine(to: CGPoint(x: .max, y: 20))
        aPath.close()
        UIColor.systemGray4.set()
        aPath.lineWidth = 2.0
        aPath.stroke()
    }
}
