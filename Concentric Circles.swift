//
//  Concentric Circles.swift
//  sample
//
//  Created by Andrei Konovalov on 1/20/19.
//  Copyright © 2019 Andrei Konovalov. All rights reserved.
//

import Foundation
import UIKit

class Circle: UIView{
    var CircleAmount = 0
    var planeAmount = 0
    var coord = Array<(x:CGFloat,y:CGFloat)>()
    
     init (CircleAmount: Int, planeAmount:Int){
        self.CircleAmount = CircleAmount
        self.planeAmount = planeAmount
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0));
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    }
    
   

    func getdist()->CGFloat{
        return CGFloat(distBetweenCircles)
    }
    var distBetweenCircles: Double = 0
    //var planes = [UIImageView]()
    var paths = [UIBezierPath]()
    
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: rect.width/2, y: rect.height/2)
        
        
        for _ in 0..<CircleAmount{
            paths.append(UIBezierPath())
        }
        //        for _ in 0..<planeAmount{
        //            planes.append(imageView)
        //        }
        
        for i in 0..<CircleAmount {
            let r: Double = Double(rect.width) / 2 - ((Double(rect.width) / 2)
                / Double(CircleAmount + 1)) * Double(i)
            paths[i].move(to: CGPoint(x: center.x + CGFloat(r), y: center.y))
            
            for j in stride(from: 0, to: 361.0, by: 5){
                let radiants = j * Double.pi / 180
                let x = Double(center.x) + r * cos(radiants)
                let y = Double(center.y) + r * sin(radiants)
                paths[i].addLine(to: CGPoint(x: x, y: y))
            }
            UIColor.green.setStroke()
            paths[i].stroke()
            
            
            let rbig: Double = Double(rect.width) / 2 - ((Double(rect.width) / 2) /
                Double(CircleAmount + 1)) * Double(i)
            let rsmall: Double = Double(rect.width) / 2 - ((Double(rect.width) / 2) /
                Double(CircleAmount + 1)) * Double(i+1)
            distBetweenCircles = rbig - rsmall
        }
        
        for i in 0..<planeAmount{
            let angle = RandomAngle()
            let r = RandomRadius(rect, imHeight: sqrt(pow(distBetweenCircles,2)/2) - sqrt(pow(distBetweenCircles,2))/3,
                                 imWidth: sqrt(pow(distBetweenCircles,2)/2) - sqrt(pow(distBetweenCircles,2)/3))
            
            coord.append((x: CGFloat(Double(center.x) + r * cos(angle)) ,
                          y: CGFloat(Double(center.y) + r * sin(angle))))
            
            print(coord[i].x," ",coord[i].y)
        }
        //print(1)
    }
    
    func RandomAngle() ->Double {
        let angleRads = (Double.random(in: 0 ..< 361.0)) * (Double.pi / 180)
        return angleRads
    }
    
    func RandomRadius(_ rect: CGRect, imHeight: Double, imWidth: Double) ->Double {
        var rad = [Double]()
        let picRad = sqrt(pow(imWidth,2)+pow(imHeight,2))
        for i in 0..<CircleAmount {
            let rbig: Double = Double(rect.width) / 2 - ((Double(rect.width) / 2) /
                Double(CircleAmount + 1)) * Double(i)
            let rsmall: Double = Double(rect.width) / 2 - ((Double(rect.width) / 2) /
                Double(CircleAmount + 1)) * Double(i+1)
            
            print(rsmall + picRad, " ", rbig - picRad)
            
            
            if( rbig - picRad >= rsmall + picRad ){
                rad.append(Double.random(in: rsmall + picRad ..< rbig - picRad ))
                
            }
        }
        
        let FinRad = rad.randomElement()
        return FinRad!
    }
    
}
