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
        
        //再生停止ボタンの初期値(再生)を設定 (0.03)
        B_StartStop.setTitle("再生", for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //再生停止ボタンのAction (0,03)
    @IBAction func A_Push(_ sender: Any) {
        
        //カレントタイトルを取得
        let V_CurrentTitle:String = (sender as AnyObject).currentTitle!!
        
        //タイトルを切り替え
        if V_CurrentTitle == "再生" {
            B_StartStop.setTitle("停止", for: .normal)
        } else {
            B_StartStop.setTitle("再生", for: .normal)
        }
        
    }
}

