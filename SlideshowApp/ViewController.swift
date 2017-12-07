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
    
    let image1: UIImage! = UIImage(named: "IMG_2228.jpg")
    let image2: UIImage! = UIImage(named: "IMG_2229.jpg")
    let image3: UIImage! = UIImage(named: "IMG_2230.jpg")
    var imageList:[UIImage] = [UIImage]()
    var picNum = 0
    var timer: Timer!
    var timer_sec: Float = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageList = [image1, image2, image3]
        self.picView.image = imageList[picNum]
        self.picView.isUserInteractionEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateTimer(timer: Timer) {
        self.picNum += 1
        if picNum > 2 {
        picNum = 0
        }
        self.picView.image = imageList[picNum]
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
        self.picView.image = imageList[picNum]
    }

    @IBAction func gobackwardButton(_ sender: Any) {

        self.picNum -= 1
        if picNum < 0 {
            picNum = 2
        }
        self.picView.image = imageList[picNum]
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let expandViewController:ExpandViewController = segue.destination as! ExpandViewController
        expandViewController.expand_pic = imageList[picNum]
    }
    
}
