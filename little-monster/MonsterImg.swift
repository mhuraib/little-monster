//
//  MonsterImg.swift
//  little-monster
//
//  Created by Mohammed Huraib on 7/1/16.
//  Copyright © 2016 Mohammed Huraib. All rights reserved.
//

import Foundation
import UIKit

class MonsterImg : UIImageView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder : NSCoder)
    {
        super.init(coder: aDecoder)
        playIdleAnimation()
    }
    
    func playIdleAnimation() {
        self.image = UIImage(named: "idle1.png")
        var monsterImags : [UIImage] = []
        self.animationImages = nil
        monsterImags.append(UIImage(named:"idle1")!)
        monsterImags.append(UIImage(named:"idle2")!)
        monsterImags.append(UIImage(named:"idle3")!)
        monsterImags.append(UIImage(named:"idle4")!)
        
        self.animationImages = monsterImags
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    
    func playDeathAnimation() {
        
        self.image = UIImage(named: "dead5.png")
        var monsterImags : [UIImage] = []
        self.animationImages = nil
        monsterImags.append(UIImage(named:"dead1")!)
        monsterImags.append(UIImage(named:"dead2")!)
        monsterImags.append(UIImage(named:"dead3")!)
        monsterImags.append(UIImage(named:"dead4")!)
        monsterImags.append(UIImage(named:"dead5")!)
        
        self.animationImages = monsterImags
        self.animationDuration = 0.8
        self.animationRepeatCount = 1
        self.startAnimating()
        
    }
}