//
//  players.swift
//  WizardSchool
//
//  Created by kcarter on 5/1/15.
//  Copyright (c) 2015 kcarter. All rights reserved.
//

import UIKit

class players: UIView {

    var str = Int()
    var dex = Int()
    var wil = Int()
    var stunned = Int()
    var id = Int()
    var trapLvl = Int()
    
    convenience init(str: Int, dex: Int, wil: Int, peice: UIView, stunned: Int, id: Int, trapLvl: Int)
    
    {
    self.init()
    self.str = str
    self.dex = dex
    self.wil = wil
    self.stunned = stunned
    self.id = id
    self.trapLvl = trapLvl

    }
}
