//
//  ViewController.swift
//  SlideshowApp
//
//  Created by mimieden on 2017/06/16.
//  Copyright © 2017年 mimieden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//--------------------------------------------------
//  変数(Outlet) *Outlet作成&RestrationIDのセット
//--------------------------------------------------
    //スライドショーのOutlet作成
    @IBOutlet weak var IMG_Slideshow: UIImageView!
    
    //再生停止ボタンのOutlet作成 
    @IBOutlet weak var B_StartStop: UIButton!
    
    //進むボタンのOutlet作成
    @IBOutlet weak var B_Next: UIButton!
    
    //戻るボタンのOutlet作成
    @IBOutlet weak var B_Previous: UIButton!
    
//--------------------------------------------------
//  変数/定数
//--------------------------------------------------
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
    
    //配列操作用のインデックス (0.12)
    var V_Index: Int = 0
    
    //配列から取得する画像名称 (0.12)
    var V_PicName: String = ""
    
    //スライドショーコントロールのためにタイマー用の変数を宣言 (0.20)
    var V_Timer:Timer!

//--------------------------------------------------
//  関数(ライフサイクル)
//--------------------------------------------------
    //View読み込み後
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

    
//--------------------------------------------------
//  関数(Action)
//--------------------------------------------------
    //再生停止ボタンのAction作成 (0.03)
    @IBAction func A_Push(_ sender: Any) {
        
        //ステータスに応じてボタンの表示を切り替え & 画像を進めるためのタイマー操作
        if B_StartStop.currentTitle == "再生" {          //停止状態で再生ボタンを押下
            B_StartStop.setTitle("停止", for: .normal)       //ボタンタイトルを停止に
            B_Next.isEnabled = false                        //進むボタンを無効化
            B_Previous.isEnabled = false                    //戻るボタンを無効化
                                                            //2秒ごとに動く関数を呼び出し
            self.V_Timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(F_TimerCallFunction), userInfo: nil, repeats: true)
        } else {                                        //再生状態で停止ボタンを押下
            B_StartStop.setTitle("再生", for: .normal)       //ボタンタイトルを再生に
            B_Next.isEnabled = true                         //進むボタンを有効化
            B_Previous.isEnabled = true                     //戻るボタンを有効化
            self.V_Timer.invalidate()                       //タイマーを破棄
        }
    }
    
    //進むボタンのAction
    @IBAction func A_Next(_ sender: Any) {
        //1つ後の画像を表示
        F_ShowNextImage()
    }
    
    //戻るボタンのAction
    @IBAction func A_Previous(_ sender: Any) {
        //1つ前の画像を表示
        F_ShowPreviousImage()
    }
    
    
    //"ZoomView"から戻ってくるときのAction
    @IBAction func A_Unwind(segue: UIStoryboardSegue) {
    }    
    
//--------------------------------------------------
//  関数(画面遷移)
//--------------------------------------------------
    // ZoomViewControllerの遷移時の値の受け渡し (0.35)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //スライドショー再生時のタイマー破棄 (1.02)
        if B_StartStop.currentTitle == "停止" {
            B_StartStop.setTitle("再生", for: .normal)
            self.V_Timer.invalidate()
            B_Next.isEnabled = true          //(0.21)
            B_Previous.isEnabled = true      //(0.21)
        }
        
        // segueから遷移先のZoomViewControllerを取得する (0.35)
        let L_ZoomViewController:ZoomViewController = segue.destination as! ZoomViewController
        
        // 遷移先のZoomViewControllerで宣言しているV_ImageNameに値を代入して渡す (0.35)
        V_PicName = L_ImageName[V_Index]
        L_ZoomViewController.V_ImageName = V_PicName
    }
    
//--------------------------------------------------
//  関数(内部呼び出し)
//--------------------------------------------------
//--タイマー起動で起動される関数-------------------------
    func F_TimerCallFunction(timer: Timer) {
        // インデックスを繰り上げるの関数を呼び出し
        F_ShowNextImage()
    }

//--1つ後の画像を表示する関数----------------------------
    func F_ShowNextImage() {
        
        //ローカル定数:配列の要素数からインデックスの最大値を取得
        let LL_MaxIndex = L_ImageName.count - 1
        
        //インデックスを繰り上げる
        if V_Index == LL_MaxIndex {      //最大の場合は0に戻す
            V_Index = 0
        } else {
            V_Index += 1                 //+1
        }
        
        //繰り上げたインデックスと同じインデックスの写真名を配列から変数に取得 (0.20)
        V_PicName = L_ImageName[V_Index]
        
        //取得したインデックス番号の画像データを表示 (0.20)
        IMG_Slideshow.image = UIImage(named: V_PicName) //繰り上げたインデックス番号の画像をImage Viewへセットする
    }

//--1つ前の画像を表示する関数----------------------------
    func F_ShowPreviousImage() {
        
        //ローカル定数:配列の要素数からインデックスの最大値を取得
        let LL_MaxIndex = L_ImageName.count - 1
        
        //インデックスを繰り下げる (0.13)
        if V_Index == 0 {
            V_Index = LL_MaxIndex
        } else {
            V_Index -= 1
        }
        
        //繰り上げたインデックスと同じインデックスの写真名を配列から変数に取得 (0.13)
        V_PicName = L_ImageName[V_Index]
        
        //取得したインデックス番号の画像データを表示 (0.13)
        IMG_Slideshow.image = UIImage(named: V_PicName) //繰り上げたインデックス番号の画像をImage Viewへセットする
    }

}
