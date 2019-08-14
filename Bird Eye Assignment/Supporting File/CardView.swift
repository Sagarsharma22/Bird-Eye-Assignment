//
//  CardView.swift
//  MACOCO
//
//  Created by Kripa Tripathi on 08/01/18.
//  Copyright © 2018 Kripa Tripathi. All rights reserved.
//

import UIKit

@IBDesignable
class CardView: UIView {
  @IBInspectable var cornerRadius: CGFloat = 2.0
  
  @IBInspectable var shadowOffsetWidth: Int = 1
  @IBInspectable var shadowOffsetHeight: Int = 1
  @IBInspectable var shadowColor: UIColor? = UIColor.black
  @IBInspectable var shadowOpacity: Float = 0.2
  
  override func layoutSubviews() {
    self.backgroundColor = UIColor.white
    layer.cornerRadius = cornerRadius
    layer.borderColor = UIColor.lightGray.cgColor
    layer.borderWidth = 0.2
    layer.shadowColor = shadowColor?.cgColor
    layer.shadowOpacity = shadowOpacity
    layer.shadowRadius = cornerRadius
    layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
  }

}
