//
//  ScaleView.swift
//  Weights
//
//  Created by Artem Klimenko on 12.07.18.
//  Copyright © 2018 velkonost. All rights reserved.
//

import UIKit

@IBDesignable
class ScaleView: UIView {

    override func draw(_ rect: CGRect) {
		let context = UIGraphicsGetCurrentContext()
		context?.setStrokeColor(UIColor.red.cgColor)
		context?.setLineWidth(14.0)
		context?.addArc(center: CGPoint(x: 375 / 2, y: 375 / 2), radius: 375 / 2 - 14, startAngle: 0, endAngle: 2 * CGFloat(Double.pi), clockwise: true)
		context?.strokePath()
		
		context?.setLineWidth(1.0)
		context?.setStrokeColor(UIColor.lightGray.cgColor)
		context?.addArc(center: CGPoint(x: 375 / 2, y: 375 / 2), radius: 375 / 4 - 14, startAngle: 0, endAngle: 2 * CGFloat(Double.pi), clockwise: true)
		context?.strokePath()
    }
	

}
