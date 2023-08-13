//
//  ESCCircularCornerArcView.swift
//  ESCCircularCornerArc
//
//  Created by xiatian on 2023/8/11.
//

import UIKit

class ESCCircularCornerArcView: UIView {


    override init(frame: CGRect) {
        super.init(frame: frame)
        
       
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        

        let centPoint = CGPoint(x: 100, y: 100)
        
        let startAngle = -30 / 180.0 * CGFloat.pi
        let endAngle = 90 / 180.0 * CGFloat.pi
        self.createArc(radio: 5, radius1: 80, radius2: 60,centPoint: centPoint,startAngle: startAngle,endAngle: endAngle)
        
        
        
        
        //系统的圆角会超出绘制角度
        self.createSystemArc(radio: 70, centPoint: CGPoint(x: 100, y: 300), startAngle: startAngle, endAngle: endAngle)

        
        
    }
    
    func createSystemArc(radio:CGFloat,centPoint:CGPoint,startAngle:CGFloat,endAngle:CGFloat){
        let path = UIBezierPath()
        
        path.addArc(withCenter: centPoint, radius: radio, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        let dataLayer2 = CAShapeLayer()
        dataLayer2.path = path.cgPath
        dataLayer2.lineWidth = 20
        dataLayer2.lineCap = .round
        
//
        dataLayer2.strokeColor = UIColor.green.cgColor
        dataLayer2.fillColor = UIColor.clear.cgColor

        self.layer.addSublayer(dataLayer2)
    }
    
    func createArc(radio:CGFloat,radius1:CGFloat,radius2:CGFloat,centPoint:CGPoint,startAngle:CGFloat,endAngle:CGFloat){
        
    
        let path = UIBezierPath()
        
        // 添加第一个圆弧
        path.addArc(withCenter: centPoint, radius: radius1, startAngle: startAngle + radio / 180 * CGFloat.pi, endAngle: endAngle - radio / 180 * CGFloat.pi, clockwise: true)

        
//        计算最终的点

        let angle = endAngle  - CGFloat.pi
        
        let length = radius1 * sin(angle)
        let offx = radius1 * cos(angle)

        
        let controlPoint = CGPoint(x: centPoint.x - offx, y: centPoint.y - length)

        let endPoint = CGPoint(x: centPoint.x - offx * 0.9, y: centPoint.y - length * 0.9)

        
        path.addQuadCurve(to: endPoint, controlPoint: controlPoint)
        
        
        let length2 = radius2 * sin(angle)
        let offx2 = radius2 * cos(angle)
        let endPoint2 = CGPoint(x: centPoint.x - offx2 * 1.1, y: centPoint.y - length2 * 1.1)
        path.addLine(to: endPoint2)
        
        let controlPoint3 = CGPoint(x: centPoint.x - offx2, y: centPoint.y - length2)
        
        let endpoint3Angle = angle - radio / 180 * CGFloat.pi
        let length3 = radius2 * sin(endpoint3Angle)
        let offx3 = radius2 * cos(endpoint3Angle)
        let endPoint3 = CGPoint(x: centPoint.x - offx3 , y: centPoint.y - length3 )

        path.addQuadCurve(to: endPoint3, controlPoint: controlPoint3)

        
        // 添加第二个圆弧
        path.addArc(withCenter: centPoint, radius: radius2, startAngle: endAngle - radio / 180 * CGFloat.pi, endAngle: startAngle + (radio + 3) / 180 , clockwise: false)
        
        let angle4 = startAngle  - CGFloat.pi / 2.0
        
        let offy4 = radius2 * cos(angle4)
        let offx4 = radius2 * sin(angle4)
        
        let controlPoint4 = CGPoint(x: centPoint.x - offx4, y: centPoint.y + offy4)
//        let length2 = (radius1 - 3) * sin(angle)
        let endPoint4 = CGPoint(x: centPoint.x - offx4 * 1.1, y: centPoint.y + offy4 * 1.1)
      
        
        path.addQuadCurve(to: endPoint4, controlPoint: controlPoint4)
        
        
        let offy5 = radius1 * cos(angle4)
        let offx5 = radius1 * sin(angle4)
        let endPoint5 = CGPoint(x: centPoint.x - offx5 * 0.90, y: centPoint.y + offy5 * 0.90)
        path.addLine(to: endPoint5)
//
        let controlPoint6 = CGPoint(x: centPoint.x - offx5, y: centPoint.y + offy5)

        let endpoint6Angle = angle4 + radio / 180 * CGFloat.pi
        let offy6 = radius1 * cos(endpoint6Angle)
        let offx6 = radius1 * sin(endpoint6Angle)
        let endPoint6 = CGPoint(x: centPoint.x - offx6 , y: centPoint.y + offy6 )

        path.addQuadCurve(to: endPoint6, controlPoint: controlPoint6)

        
        
        let dataLayer1 = CAShapeLayer()
        dataLayer1.path = path.cgPath
        dataLayer1.lineWidth = 1
//
        dataLayer1.strokeColor = UIColor.clear.cgColor
        dataLayer1.fillColor = UIColor.red.cgColor
//
//
        self.layer.addSublayer(dataLayer1)
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        
        
    }

}



