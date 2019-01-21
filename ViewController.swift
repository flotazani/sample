//
//  ViewController.swift
//  sample
//
//  Created by Andrei Konovalov on 1/17/19.
//  Copyright © 2019 Andrei Konovalov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let CircleAmount = 2
    let planeAmount = 30
    var ims = [UIImage]()
    var imageView = UIImageView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<planeAmount{
            ims.append(UIImage(named: "plane1")!)
        }
        
        let viewcustom = Circle(CircleAmount: CircleAmount, planeAmount: planeAmount)
        self.view = viewcustom
        view.draw(UIScreen.main.bounds)
        for i in 0..<planeAmount{
            imageView = UIImageView(image: ims[i])
            imageView.frame = CGRect(x: CGFloat((viewcustom.coord[i].x) - viewcustom.getdist() / 2.2), y: CGFloat((viewcustom.coord[i].y) - viewcustom.getdist() / 2.2), width: viewcustom.getdist()-viewcustom.getdist()/10, height: viewcustom.getdist()-viewcustom.getdist()/10)
            imageView.contentMode = .scaleAspectFill
            viewcustom.addSubview(imageView)
            viewcustom.backgroundColor = .white
            
        }
    }

}

