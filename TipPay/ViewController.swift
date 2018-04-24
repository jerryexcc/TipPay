//
//  ViewController.swift
//  TipPay
//
//  Created by 世明 on 2018/4/24.
//  Copyright © 2018年 世明. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var tf_money: UITextField!
    @IBOutlet weak var tf_Tips: UITextField!
    @IBOutlet weak var img_Money: UIImageView!
    @IBOutlet weak var img_Hand: UIImageView!
    @IBOutlet weak var positionUse: UIView!
    @IBOutlet weak var thinkBubble: UIImageView!
    @IBOutlet weak var thinkingText: UILabel!
    @IBOutlet weak var thinkPoor: UIImageView!
    @IBOutlet weak var thinkPoorText: UILabel!
    
    
    @IBAction func giveTips(_ sender: Any) {
        view.endEditing(true)
        img_Money.isHidden = false
        thinkBubble.isHidden = false
        thinkingText.isHidden = false
        let num_Money = Int(tf_money.text!)
        let num_Tips = Int(tf_Tips.text!)
        if let num_Money = num_Money, num_Money > 100{
            thinkingText.text = "小費\(num_Money * num_Tips! / 100)元"
            if (num_Money * num_Tips! / 100) < 50{
                thinkPoor.isHidden = false
                thinkPoorText.isHidden = false
                thinkPoorText.text = "給的這麼窮酸"
            }else if (num_Money * num_Tips! / 100) > 100{
                thinkPoor.isHidden = false
                thinkPoorText.isHidden = false
                thinkPoorText.text = "這麼闊綽,再多凹一點吧"
            }else{
                thinkPoor.isHidden = true
                thinkPoorText.isHidden = true
            }
        }else{
            img_Money.isHidden = true
            thinkingText.text = "小費都給不起喔?"
            thinkPoor.isHidden = false
            thinkPoorText.isHidden = false
            thinkPoorText.text = "小氣巴拉的"
        }
        if img_Money.center.y != positionUse.center.y{
            //reset position
            img_Money.center.y = positionUse.center.y
        }
        UIView.animate(withDuration: 1) {
            self.moveUp(view: self.img_Money)
        }
    }
    
    func moveUp(view: UIView){
        img_Money.center.y -= 300
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

