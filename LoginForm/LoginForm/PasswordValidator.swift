//
//  PasswordValidator.swift
//  LoginForm
//
//  Created by Abhishek Mishra on 16/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import Foundation

class PasswordValidator: NSObject {

    func validate(_ value:String) -> Bool {
        if ((value.characters.count < 6) || (value.characters.count > 10)) {
            return false
        }
        
        let whitespace = Set(" ".characters)
        if (value.characters.filter {whitespace.contains($0)}).count > 0 {
            return false
        }

        let uppercaseAlphabets = Set("ABCDEFGHIJKLMNOPQRSTUVWXYZ".characters)
        if (value.characters.filter {uppercaseAlphabets.contains($0)}).count == 0 {
            return false
        }
        
        let lowercaseAlphabets = Set("abcdefghijklmnopqrstuvwxyz".characters)
        if (value.characters.filter {lowercaseAlphabets.contains($0)}).count == 0 {
            return false
        }
        
        let numbers = Set("0123456789".characters)
        if (value.characters.filter {numbers.contains($0)}).count == 0 {
            return false
        }
        
        return true
    }

}
