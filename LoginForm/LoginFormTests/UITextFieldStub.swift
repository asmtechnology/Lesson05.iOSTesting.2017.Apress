//
//  UITextFieldStub.swift
//  LoginForm
//
//  Created by Abhishek Mishra on 29/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import UIKit

class UITextFieldStub : UITextField {
    
    init(text:String) {
        super.init(frame: CGRect.zero)
        super.text = text
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
