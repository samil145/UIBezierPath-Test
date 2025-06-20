//
//  SquareViewController.swift
//  UIBezierPath Test
//
//  Created by Shamil Bayramli on 19.06.25.
//

import UIKit

class SquareViewController: UIViewController {
    
    var shape: CAShapeLayer?

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        shape?.removeFromSuperlayer()
        drawSquare()
    }
    
    func drawSquare()
    {
        let shapeLayer = CAShapeLayer()
        shapeLayer.position = CGPoint(x: view.frame.midX - 50, y: view.frame.midY - 50)
        shapeLayer.fillColor = UIColor.tintColor.cgColor
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: .zero)
        bezierPath.addLine(to: CGPoint(x: 100, y: 0))
        bezierPath.addLine(to: CGPoint(x: 100, y: 100))
        bezierPath.addLine(to: CGPoint(x: 0, y: 100))
        bezierPath.addLine(to: .zero)
        bezierPath.close()
        
        shapeLayer.path = bezierPath.cgPath
        self.view.layer.addSublayer(shapeLayer)
        self.shape = shapeLayer
        
    }
}
