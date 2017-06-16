//
//  ViewController.swift
//  SlideshowApp
//
//  Created by mimieden on 2017/06/16.
//  Copyright © 2017年 mimieden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //再生停止ボタンのOutpet (0.02)
    @IBOutlet weak var B_StartStop: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    //再生停止ボタンの文字を設定する（通常時）(0.02)
        B_StartStop.setTitle("再生", for: .normal)
        print(B_StartStop.titleLabel as Any)
    //再生停止ボタンの文字を設定する（押下時）(0.02)
        B_StartStop.setTitle("停止", for:.highlighted)
        print(B_StartStop.titleLabel as Any)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

