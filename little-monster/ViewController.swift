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
    
    let DIM_ALPHA : CGFloat = 0.2
    let OPAQUE : CGFloat = 1.0
    let MAX_LIVES = 3
    var deaths = 0
    var timer : NSTimer!
    var monsterHappy = false
    var currentItem: UInt32 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.itemDroppedOnCharacter(_:)), name: "onTargetDropped", object: nil)
        foodImg.dropTarget = monsterImg
        heartImg.dropTarget = monsterImg
        
        firstSkullImg.alpha = DIM_ALPHA
        secondSkullImg.alpha = DIM_ALPHA
        thirdSkullImg.alpha = DIM_ALPHA
        startTimer()
        
    }
    
    func itemDroppedOnCharacter (notify : AnyObject){
        
        monsterHappy = true
        startTimer()
        
        foodImg.alpha = DIM_ALPHA
        foodImg.userInteractionEnabled = false
        
        heartImg.alpha = DIM_ALPHA
        heartImg.userInteractionEnabled = false
    }
    
    func startTimer(){
        if timer != nil{
            timer.invalidate()
        }
        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.changeGameState), userInfo: nil , repeats: true)
    }
    func changeGameState(){
        
        if !monsterHappy {
            
            deaths = deaths + 1
            if deaths == 1{
                thirdSkullImg.alpha = OPAQUE
            }
            else if deaths == 2 {
                secondSkullImg.alpha = OPAQUE
            }
            else
            {
                firstSkullImg.alpha = OPAQUE
                gameOver()
            }
        }
        
        let random = arc4random_uniform(2)
        
        if random == 0{
            foodImg.alpha = DIM_ALPHA
            foodImg.userInteractionEnabled = false
            
            heartImg.alpha = OPAQUE
            heartImg.userInteractionEnabled = true
        }
        else{
            foodImg.alpha = OPAQUE
            foodImg.userInteractionEnabled = true
            
            heartImg.alpha = DIM_ALPHA
            heartImg.userInteractionEnabled = false
        }
        
        currentItem = random
        monsterHappy = false
        
    }
    
    func gameOver(){
        monsterImg.playDeathAnimation()
        
        foodImg.alpha = DIM_ALPHA
        foodImg.userInteractionEnabled = false
        
        heartImg.alpha = DIM_ALPHA
        heartImg.userInteractionEnabled = false
        timer.invalidate()
    }
    
    
    
    



}

