//
//  ViewController.swift
//  little-monster
//
//  Created by Mohammed Huraib on 7/1/16.
//  Copyright © 2016 Mohammed Huraib. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstSkullImg: UIImageView!
    @IBOutlet weak var secondSkullImg: UIImageView!
    @IBOutlet weak var thirdSkullImg: UIImageView!
    @IBOutlet weak var monsterImg: MonsterImg!
    @IBOutlet weak var foodImg: DragImage!
    @IBOutlet weak var heartImg: DragImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.itemDroppedOnCharacter(_:)), name: "onTargetDropped", object: nil)
        foodImg.dropTarget = monsterImg
        heartImg.dropTarget = monsterImg
        
    }
    
    func itemDroppedOnCharacter (notify : AnyObject){
        
        print("YEP")
    }
    
    
    



}

