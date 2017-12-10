//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 土井愛己 on 2017/12/03.
//  Copyright © 2017年 aiki.doi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var picView: UIImageView!
    @IBOutlet weak var playstopButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backwardButton: UIButton!
    
    var imageList:[String] = ["IMG_2228.jpg", "IMG_2229.jpg", "IMG_2230.jpg"]
    var picNum = 0
    var timer: Timer!
    var timer_sec: Float = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.picView.image = UIImage(named: imageList[picNum])
        self.picView.isUserInteractionEnabled = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTimer(timer: Timer) {
        self.picNum += 1
        if picNum > imageList.count - 1 {
            picNum = 0
        }
        self.picView.image = UIImage(named: imageList[picNum])
    }
    
    @IBAction func playstopButton(_ sender: Any) {
        
        if self.timer == nil {
            self.playstopButton.setTitle("停止", for: .normal)
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            self.forwardButton.isEnabled = false
            self.backwardButton.isEnabled = false
        } else {
            self.timer.invalidate()
            self.timer = nil
            self.playstopButton.setTitle("再生", for: .normal)
            self.forwardButton.isEnabled = true
            self.backwardButton.isEnabled = true
        }
    }
    @IBAction func goforwardButton(_ sender: Any) {
        
        self.picNum += 1
        if picNum > 2 {
            picNum = 0
        }
        self.picView.image = UIImage(named: imageList[picNum])
    }
    
    @IBAction func gobackwardButton(_ sender: Any) {
        
        self.picNum -= 1
        if picNum < 0 {
            picNum = 2
        }
        self.picView.image = UIImage(named: imageList[picNum])
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let expandViewController:ExpandViewController = segue.destination as! ExpandViewController
        expandViewController.expand_pic = UIImage(named: imageList[picNum])
    }
    
}
