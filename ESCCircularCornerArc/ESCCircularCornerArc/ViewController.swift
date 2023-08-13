//
//  ViewController.swift
//  ESCCircularCornerArc
//
//  Created by xiatian on 2023/8/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let view = ESCCircularCornerArcView(frame: CGRect(origin: CGPoint(x: 10, y: 100), size: CGSize(width: 200, height: 400)))
        self.view.addSubview(view)
    }


}

