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
    
    //画像の名称を配列に入れる (0.12)
    let L_ImageName = [
        "000.jpg",
        "001.JPG",
        "002.JPG",
        "003.JPG",
        "004.JPG",
        "005.JPG",
        "006.JPG",
        "007.JPG",
        "008.jpg",
        "009.JPG",
        "010.JPG",
        "011.JPG",
        "012.jpg",
        "013.jpg",
        "014.jpg",
        "015.jpg",
    ]
    
    //配列操作用の変数 (0.12)
    var V_Index: Int = 0
    //配列から取得する画像名称
    var V_PicName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //再生停止ボタンの初期値(再生)を設定 (0.03)
        B_StartStop.setTitle("再生", for: .normal)
        
        //画像データ1枚目を表示 (0.11)
        IMG_Slideshow.image = UIImage(named: "000.JPG") //画像"00.JPG"を読み込みImage Viewへセットする
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
    
    //進むボタンのAction作成 (0.12)
    @IBAction func A_Next(_ sender: Any) {
        
        //インデックスを繰り上げる
        if V_Index < 15 {       //Current Index:0~14 => Next Index:+1
            V_Index += 1
        } else {                //Current Index:15   => Next Index:-1
            V_Index = 0
        }
        
        //繰り上げたインデックスと同じインデックスの写真名を配列から変数に取得
        V_PicName = L_ImageName[V_Index]
        
        //取得したインデックス番号の画像データを表示
        IMG_Slideshow.image = UIImage(named: V_PicName) //繰り上げたインデックス番号の画像をImage Viewへセットする
    }
    
    //戻るボタンのAction作成 (0.12)
    @IBAction func A_Previous(_ sender: Any) {
    }
    
}

