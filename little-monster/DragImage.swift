//
//  DragImage.swift
//  little-monster
//
//  Created by Mohammed Huraib on 7/1/16.
//  Copyright © 2016 Mohammed Huraib. All rights reserved.
//

import Foundation
import UIKit

class DragImage : UIImageView {
    
    var originalPosition : CGPoint!
    var dropTarget: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder : NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        originalPosition = self.center
        
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first {
            
            let position = touch.locationInView(self.superview)
            self.center = CGPointMake(position.x, position.y)
        }
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let target = dropTarget {
            
            if CGRectContainsRect(target.frame, self.frame){
                
                NSNotificationCenter.defaultCenter().postNotification(NSNotification(name : "onTargetDropped", object: nil))
            }
            else
            {
                print("NOPE!")
            }
        }
        
        self.center = originalPosition
        
        
    }
}