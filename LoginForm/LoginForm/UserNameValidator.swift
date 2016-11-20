//
//  UserNameValidator.swift
//  LoginForm
//
//  Created by Abhishek Mishra on 16/11/2016.
//  Copyright © 2016 ASM Technology Ltd. All rights reserved.
//

import Foundation

class UserNameValidator: NSObject {

    func validate(_ value:String) -> Bool {
        if ((value.characters.count < 2) || (value.characters.count > 10)) {
            return false
        }
        
        let whitespace = Set(" ".characters)
        if (value.characters.filter {whitespace.contains($0)}).count > 0 {
            return false
        }
        
        let specialCharacters = Set("+-.,!@#$%^&*();\\/|<>\"".characters)
        if (value.characters.filter {specialCharacters.contains($0)}).count > 0 {
            return false
        }
        
        guard let regexValidator = try? NSRegularExpression(pattern: "([A-Za-z0-9'])", options: .caseInsensitive) else {
            return false
        }
        
        if regexValidator.numberOfMatches(in: value,
                                          options: NSRegularExpression.MatchingOptions.reportCompletion,
                                          range: NSMakeRange(0, value.characters.count)) > 0 {
            return true
        }
        
        return false
    }

    
}
