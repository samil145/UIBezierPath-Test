//
//  DShapeViewController.swift
//  UIBezierPath Test
//
//  Created by Shamil Bayramli on 19.06.25.
//

import UIKit

class DShapeViewController: UIViewController {
    var shape: CAShapeLayer?

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        shape?.removeFromSuperlayer()
        drawDShape()
    }

    func drawDShape()
    {
        let shapeLayer = CAShapeLayer()
        shapeLayer.position = CGPoint(x: view.frame.midX - 37.5, y: view.frame.midY - 50)
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.strokeColor = UIColor.tintColor.cgColor
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: .zero)
        bezierPath.addCurve(to: CGPoint(x: 0, y: 100),
                            controlPoint1: CGPoint(x: 75, y: 0),
                            controlPoint2: CGPoint(x: 75, y: 100))
        bezierPath.addLine(to: .zero)
        bezierPath.close()
        
        
        
        shapeLayer.path = bezierPath.cgPath
        self.view.layer.addSublayer(shapeLayer)
        self.shape = shapeLayer
    }

}
