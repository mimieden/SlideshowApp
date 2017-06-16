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
    
    //進むボタンのOutlet作成 (0.21) *Restoration IDもセット
    @IBOutlet weak var B_Next: UIButton!
    
    //戻るボタンのOutlet作成 (0.21) *Restoration IDもセット
    @IBOutlet weak var B_Previous: UIButton!
    
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
    
    //配列から取得する画像名称 (0.12)
    var V_PicName: String = ""
    
    //スライドショーコントロールのためにタイマー用の変数を宣言 (0.20)
    var V_Timer:Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //再生停止ボタンの初期値(再生)を設定 (0.03)
        B_StartStop.setTitle("再生", for: .normal)
        
        //画像データ1枚目を表示 (0.14)
        V_PicName = L_ImageName[V_Index]                 //インデックス(初期値)と同じインデックスの写真名を配列から変数に取得
        IMG_Slideshow.image = UIImage(named: V_PicName)  //取得したインデックス番号の画像をImage Viewへセットする
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //タイマーが始動すると2秒ごとに呼び出される関数 => インデックスを繰り上げて画像表示を行う (0.20)
    func F_UpdateTimer(timer: Timer) {
        //インデックスを繰り上げる (0.20)
        if V_Index < 15 {       //Current Index:0~14 => Next Index:+1
            V_Index += 1
        } else {                //Current Index:15   => Next Index:-1
            V_Index = 0
        }
        
        //繰り上げたインデックスと同じインデックスの写真名を配列から変数に取得 (0.20)
        V_PicName = L_ImageName[V_Index]
        
        //取得したインデックス番号の画像データを表示 (0.20)
        IMG_Slideshow.image = UIImage(named: V_PicName) //繰り上げたインデックス番号の画像をImage Viewへセットする
    }


    //再生停止ボタンのAction作成 (0.03)
    @IBAction func A_Push(_ sender: Any) {
        
        //カウントアップ変数よりステータス判断 (0.03)
        V_Status = V_CountUp % 2          //カウントアップ変数から偶数/奇数を判断
        V_CountUp += 1                    //ステータス判断したのでカウントアップ
        
        //ステータスに応じてタイトルを切り替え & タイマーコントロール (0.20)
        //偶数 = 停止状態で再生ボタン押下 => 停止ボタンを表示して再生するためにタイマー始動 (0.20) & 進む/戻るボタンの制御 (0.21)
        if V_Status == 0 {
            B_StartStop.setTitle("停止", for: .normal)
            self.V_Timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(F_UpdateTimer), userInfo: nil, repeats: true)
            B_Next.isEnabled = false         //(0.21)
            B_Previous.isEnabled = false     //(0.21)
        //奇数 = 再生状態で停止ボタン押下 => 再生ボタンを表示して停止するためにタイマー破棄 (0.20) & 進む/戻るボタンの制御 (0.21)
        } else {
            B_StartStop.setTitle("再生", for: .normal)
            self.V_Timer.invalidate()
            B_Next.isEnabled = true          //(0.21)
            B_Previous.isEnabled = true      //(0.21)
        }
    }

    //進むボタンのAction作成 (0.12)
    @IBAction func A_Next(_ sender: Any) {
        
        //インデックスを繰り上げる (0.12)
        if V_Index < 15 {       //Current Index:0~14 => Next Index:+1
            V_Index += 1
        } else {                //Current Index:15   => Next Index:-1
            V_Index = 0
        }
        
        //繰り上げたインデックスと同じインデックスの写真名を配列から変数に取得 (0.12)
        V_PicName = L_ImageName[V_Index]
        
        //取得したインデックス番号の画像データを表示 (0.12)
        IMG_Slideshow.image = UIImage(named: V_PicName) //繰り上げたインデックス番号の画像をImage Viewへセットする
    }
    
    //戻るボタンのAction作成 (0.12)
    @IBAction func A_Previous(_ sender: Any) {

        //インデックスを繰り下げる (0.13)
        if V_Index > 0 {       //Current Index:1~15 => Next Index:-1
            V_Index -= 1
        } else {                //Current Index:0   => Next Index:15
            V_Index = 15
        }
        
        //繰り上げたインデックスと同じインデックスの写真名を配列から変数に取得 (0.13)
        V_PicName = L_ImageName[V_Index]
        
        //取得したインデックス番号の画像データを表示 (0.13)
        IMG_Slideshow.image = UIImage(named: V_PicName) //繰り上げたインデックス番号の画像をImage Viewへセットする
    }
    
}

