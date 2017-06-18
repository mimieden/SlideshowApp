//
//  ViewController.swift
//  SlideshowApp
//
//  Created by mimieden on 2017/06/16.
//  Copyright © 2017年 mimieden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//==================================================
// グローバル変数/定数
//==================================================
    
//--Outlet(RestrationIDもセット!)---------------------
    //スライドショーのOutlet
    @IBOutlet weak var IMG_Slideshow: UIImageView!
    
    //再生停止ボタンのOutlet
    @IBOutlet weak var B_StartStop: UIButton!
    
    //進むボタンのOutlet
    @IBOutlet weak var B_Next: UIButton!
    
    //戻るボタンのOutlet
    @IBOutlet weak var B_Previous: UIButton!
 
//--------------------------------------------------
    //(画像ファイル名
    let GL_ImageName = [
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
    var GV_Index: Int = 0
    
    //配列から取得する画像名称 (0.12)
    var GV_PicName: String = ""
    
    //スライドショーコントロールのためにタイマー用の変数を宣言 (0.20)
    var GV_Timer:Timer!

//==================================================
//  関数(ライフサイクル)
//==================================================
//--View読み込み後------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //再生停止ボタンの初期値(再生)を設定
        B_StartStop.setTitle("再生", for: .normal)
        
        //画像データ1枚目(インデックスが初期値のもの)を表示
        GV_PicName = GL_ImageName[GV_Index]               //インデックス(初期値)の写真名を配列から変数に取得
        IMG_Slideshow.image = UIImage(named: GV_PicName)  //取得した画像名をImage Viewへセットする
    }

//--------------------------------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//==================================================
//  関数(Action) *画面遷移のAction除く
//==================================================
//--再生/停止ボタン押下時に実行されるAction---------------
    @IBAction func A_Push(_ sender: Any) {
        //ステータスに応じてボタンの表示を切り替え & 画像を進めるためのタイマー操作
        if B_StartStop.currentTitle == "再生" {          //スライドショーの再生
            F_StartSlideShow()
        } else {
            F_StopSlideShow()
        }
    }
    
//--進むボタン押下時に実行されるAction-------------------
    @IBAction func A_Next(_ sender: Any) {
        F_ShowNextImage()            //1つ後の画像を表示
    }
    
//--戻るボタン押下時に実行されるAction-------------------
    @IBAction func A_Previous(_ sender: Any) {
        F_ShowPreviousImage()       //1つ前の画像を表示
    }
    
//==================================================
//  関数(画面遷移) *画面遷移のAction含む
//==================================================
//--View Controller => Zoom View Controller---------
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //スライドショー実行中の場合、スライドショーの停止
        if B_StartStop.currentTitle == "停止" {
            F_StopSlideShow()
        }
        
        // segueから遷移先のZoomViewControllerを取得する (0.35)
        let L_ZoomViewController:ZoomViewController = segue.destination as! ZoomViewController
        
        // 遷移先のZoomViewControllerで宣言しているV_ImageNameに値を代入して渡す (0.35)
        GV_PicName = GL_ImageName[GV_Index]
        L_ZoomViewController.V_ImageName = GV_PicName
    }
    
//--Zoom View Controller => View Controller---------
    @IBAction func A_Unwind(segue: UIStoryboardSegue) {
    }
    
//==================================================
//  関数(内部呼び出し)
//==================================================
//--タイマー起動で起動される関数-------------------------
    func F_TimerCallFunction(timer: Timer) {
        // インデックスを繰り上げるの関数を呼び出し
        F_ShowNextImage()
    }

//--1つ後の画像を表示する関数----------------------------
    func F_ShowNextImage() {
        
        //ローカル定数:配列の要素数からインデックスの最大値を取得
        let LL_MaxIndex = GL_ImageName.count - 1
        
        //インデックスを繰り上げる
        if GV_Index == LL_MaxIndex {      //最大の場合は0に戻す
            GV_Index = 0
        } else {
            GV_Index += 1                 //+1
        }
        
        //繰り上げたインデックスと同じインデックスの写真名を配列から変数に取得 (0.20)
        GV_PicName = GL_ImageName[GV_Index]
        
        //取得したインデックス番号の画像データを表示 (0.20)
        IMG_Slideshow.image = UIImage(named: GV_PicName) //繰り上げたインデックス番号の画像をImage Viewへセットする
    }

//--1つ前の画像を表示する関数----------------------------
    func F_ShowPreviousImage() {
        
        //ローカル定数:配列の要素数からインデックスの最大値を取得
        let LL_MaxIndex = GL_ImageName.count - 1
        
        //インデックスを繰り下げる (0.13)
        if GV_Index == 0 {
            GV_Index = LL_MaxIndex
        } else {
            GV_Index -= 1
        }
        
        //繰り上げたインデックスと同じインデックスの写真名を配列から変数に取得 (0.13)
        GV_PicName = GL_ImageName[GV_Index]
        
        //取得したインデックス番号の画像データを表示 (0.13)
        IMG_Slideshow.image = UIImage(named: GV_PicName) //繰り上げたインデックス番号の画像をImage Viewへセットする
    }
    
//--スライドショーの開始----------------------------
    func F_StartSlideShow() {
        B_StartStop.setTitle("停止", for: .normal)       //ボタンタイトルを停止に
        B_Next.isEnabled = false                        //進むボタンを無効化
        B_Previous.isEnabled = false                    //戻るボタンを無効化
        //2秒ごとに動く関数を呼び出し
        self.GV_Timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(F_TimerCallFunction), userInfo: nil, repeats: true)
    }
//--スライドショーの停止----------------------------
    func F_StopSlideShow() {
        B_StartStop.setTitle("再生", for: .normal)       //ボタンタイトルを再生に
        B_Next.isEnabled = true                         //進むボタンを有効化
        B_Previous.isEnabled = true                     //戻るボタンを有効化
        self.GV_Timer.invalidate()                       //タイマーを破棄
    }

}
