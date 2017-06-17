//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by mimieden on 2017/06/17.
//  Copyright © 2017年 mimieden. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {

    //ズームビューのOutlet作成 (0.30) *Restoration IDもセット
    @IBOutlet weak var IMG_Zoom: UIImageView!
    
    //遷移元から受け取る画像ファイル名用の変数 (0.35)
    var V_ImageName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //ズームビューに遷移元画面からもらったファイル名の画像を表示 (0.35)
        IMG_Zoom.image = UIImage(named: V_ImageName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
