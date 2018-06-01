//
//  UIViewExt.swift
//  Flash Chat
//
//  Created by Anthony Ruiz on 5/30/18.
//  Copyright © 2018 Jakaboy. All rights reserved.
//

//import Foundation
import UIKit

extension UIView{
   
   func bindKeyboard(){
      NotificationCenter.default.addObserver(self, selector: #selector(keyboardChange(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
   }
   
   @objc func keyboardChange(_ notification: Notification){
      let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
      let curve = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
      let frameBegin = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
      let frameEnd = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
      let deltaY = frameEnd.origin.y - frameBegin.origin.y
      
      UIView.animateKeyframes(withDuration: duration, delay: 0.3, options: UIViewKeyframeAnimationOptions(rawValue: curve), animations: {
         self.frame.origin.y += deltaY
      }, completion: nil)
      
   }
}
