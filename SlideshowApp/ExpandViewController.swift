//
//  ExpandViewController.swift
//  SlideshowApp
//
//  Created by 土井愛己 on 2017/12/06.
//  Copyright © 2017年 aiki.doi. All rights reserved.
//

import UIKit

class ExpandViewController: UIViewController {

    var expand_pic:UIImage?
    
    @IBOutlet weak var expand_picView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        expand_picView.image = expand_pic
        
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
