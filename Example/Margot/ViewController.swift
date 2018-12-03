//
//  ViewController.swift
//  Margot
//
//  Created by magic_harly@hotmail.com on 11/29/2018.
//  Copyright (c) 2018 magic_harly@hotmail.com. All rights reserved.
//

import UIKit
import Margot
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let intV = Int.random(in: 0..<100)
        let doubleV = Double.random(in: 0..<100)
        let cgV = CGFloat.random(in: 0..<100)
        
        let vv = 0.0
        let r = vv / 0
        let result = (intV + doubleV + cgV) / 0.0
        print(result)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

