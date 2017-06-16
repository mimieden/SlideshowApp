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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //いったんズームビューに画像"000.jpg"を固定で表示 (0.30)
        IMG_Zoom.image = UIImage(named: "000.jpg")
        
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
