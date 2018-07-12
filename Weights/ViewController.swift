//
//  ViewController.swift
//  Weights
//
//  Created by Artem Klimenko on 12.07.18.
//  Copyright © 2018 velkonost. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
	
	@IBOutlet weak var scaleView: ScaleView!
	@IBOutlet weak var forceLabel: UILabel!
	@IBOutlet weak var grammLabel: UILabel!
	
	var isPlaySound = true
	
	var isUpdate = true {
		didSet {
			if isUpdate == false {
				DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
					self.isUpdate = oldValue
				}
			}
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		forceLabel.text = "0% force"
		grammLabel.text = "0 gram"
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		if let touch = touches.first {
			if #available(iOS 9.0, *) {
				if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
					if touch.force >= touch.maximumPossibleForce {
						forceLabel.text = "100% force"
						grammLabel.text = "385 gram"
						
						if isPlaySound {
							AudioServicesPlaySystemSound(1519)
							isPlaySound = false
						}
						
					} else {
						let force = (touch.force / touch.maximumPossibleForce) * 100
						let grams = force * 385 / 100
						let roundGrams = Int(grams)
						
						isPlaySound = true
						
						if isUpdate {
							forceLabel.text = "\(Int(force))% force"
							grammLabel.text = "\(roundGrams) gram"
							isUpdate = false
						}
					}
				}
			}
		}
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		forceLabel.text = "0% force"
		grammLabel.text = "0 gram"
	}
	
	
}

