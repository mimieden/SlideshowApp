//
//  ViewController.swift
//  SlideshowApp
//
//  Created by mimieden on 2017/06/16.
//  Copyright © 2017年 mimieden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //スライドショーのOutlet作成 (0.11) *Restoration IDもセット
    @IBOutlet weak var IMG_Slideshow: UIImageView!
    
    //再生停止ボタンのOutlet作成 (0.02) *Restoration IDもセット
    @IBOutlet weak var B_StartStop: UIButton!
    
    //ステータス判定用の変数 (0.03)
    var V_CountUp: Int = 0             //カウントアップ
    var V_Status: Int = 0              //ボタン押下時のステータス

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //再生停止ボタンの初期値(再生)を設定 (0.03)
        B_StartStop.setTitle("再生", for: .normal)
        
        //画像データ1枚目を表示 (0.11)
        IMG_Slideshow.image = UIImage(named: "001.JPG") //画像"001.JPG"を読み込みImage Viewへセットする
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //再生停止ボタンのAction作成 (0.03)
    @IBAction func A_Push(_ sender: Any) {
        
        //カウントアップ変数よりステータス判断 (0.03)
        V_Status = V_CountUp % 2          //カウントアップ変数から偶数/奇数を判断
        V_CountUp += 1                    //ステータス判断したのでカウントアップ
        
        //ステータスに応じてタイトルを切り替え (0.03)
        if V_Status == 0 {                                //偶数 = 停止状態
            B_StartStop.setTitle("停止", for: .normal)     //(再生して)停止ボタンを表示
        } else {                                          //奇数 = 再生状態
            B_StartStop.setTitle("再生", for: .normal)     //(停止して)再生ボタンを表示
        }
    }
}

