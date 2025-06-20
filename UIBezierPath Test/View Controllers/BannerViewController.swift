//
//  BannerViewController.swift
//  UIBezierPath Test
//
//  Created by Shamil Bayramli on 19.06.25.
//

import UIKit

class BannerViewController: UIViewController {
    
    var topShapeLayer: CAShapeLayer?
    var botShapeLayer: CAShapeLayer?
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .systemRed
        label.text = "Banner View"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = ""
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        topShapeLayer?.removeFromSuperlayer()
        botShapeLayer?.removeFromSuperlayer()
        addTopDrawing()
        addBotDrawing()
    }
    
    func addTopDrawing()
    {
        let shapeLayer = CAShapeLayer()
        shapeLayer.position = CGPoint(x: 0, y: 0)
        shapeLayer.fillColor = UIColor.tintColor.cgColor
        //shapeLayer.lineWidth = 5
        //shapeLayer.strokeColor = UIColor.tintColor.cgColor
        
        let path = UIBezierPath()
        let rect = UIScreen.main.bounds
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height*0.3125))
        path.addCurve(to: CGPoint(x: 40, y: 75),
                      controlPoint1: CGPoint(
                        x: rect.width-40,
                        y: rect.height*0.15625),
                      controlPoint2: CGPoint(
                        x: rect.width*3/5,
                        y: rect.height*0.09375))
        path.addCurve(to: CGPoint(x: 0, y: 50),
                      controlPoint1: CGPoint(x: 10, y: 75),
                      controlPoint2: CGPoint(x: 0, y: 65))
        path.addLine(to: .zero)
        
        path.close()
        
        
        
        shapeLayer.path = path.cgPath
        self.view.layer.addSublayer(shapeLayer)
        self.topShapeLayer = shapeLayer
    }
    
    func addBotDrawing()
    {
        let rect = UIScreen.main.bounds
        let width = rect.width
        let height = rect.height
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.position = CGPoint(x: 0, y: 0)
        shapeLayer.fillColor = UIColor.tintColor.cgColor
        //shapeLayer.lineWidth = 5
        //shapeLayer.strokeColor = UIColor.tintColor.cgColor
        
        let path = UIBezierPath()

        path.move(to: CGPoint(x: 0, y: rect.height*0.6875))
        path.addCurve(to: CGPoint(x: width-40, y: height-75),
                      controlPoint1: CGPoint(
                        x: 40,
                        y: height*0.84375),
                      controlPoint2: CGPoint(
                        x: width*2/5,
                        y: height*0.90625))
        
        path.addCurve(to: CGPoint(x: width, y: height-50),
                      controlPoint1: CGPoint(
                        x: width-10,
                        y: height-75),
                      controlPoint2: CGPoint(
                        x: width,
                        y: height-65))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: rect.height*0.6875))
        path.close()
        
        
        
        shapeLayer.path = path.cgPath
        self.view.layer.addSublayer(shapeLayer)
        self.botShapeLayer = shapeLayer
    }
}
