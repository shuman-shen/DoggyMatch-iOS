//
//  selectedButton.swift
//  DM1
//
//  Created by xKiddos on 22/9/19.
//  Copyright © 2019 karen lee. All rights reserved.
//

import UIKit

class selctedButtom: UIButton {
    
    var isOn = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    func initButton() {
        
        addTarget(self, action: #selector(selctedButtom.buttonPressed), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        activateButton(bool: !isOn)
    }
    
    func activateButton(bool: Bool) {
        
        isOn = bool
        
        let color = bool ? backgroundColor : .red
        
        
        backgroundColor = color
    }
    
    
}
