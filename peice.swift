//
//  peice.swift
//  WizardSchool
//
//  Created by kcarter on 4/28/15.
//  Copyright (c) 2015 kcarter. All rights reserved.
//

import UIKit

class peice: UIView
{
    var str = Int()
    var dex = Int()
    var wil = Int()
    
    convenience init(str: Int, dex: Int, wil: Int, frame: CGRect)
        
    {
        self.init()
        self.str = str
        self.dex = dex
        self.wil = wil
        
        
        
    }
}
