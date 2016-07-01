//
//  ViewController.swift
//  little-monster
//
//  Created by Mohammed Huraib on 7/1/16.
//  Copyright © 2016 Mohammed Huraib. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monsterImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var monsterImags : [UIImage] = []
        monsterImags.append(UIImage(named:"idle1")!)
        monsterImags.append(UIImage(named:"idle2")!)
        monsterImags.append(UIImage(named:"idle3")!)
        monsterImags.append(UIImage(named:"idle4")!)
        monsterImg.animationImages = monsterImags
        monsterImg.animationDuration = 0.8
        monsterImg.startAnimating()
        
    }




}

