//
//  ViewController.swift
//  WizardSchool
//
//  Created by kcarter on 4/17/15.
//  Copyright (c) 2015 kcarter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
var stuff = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func PlayerButton2(sender: AnyObject) {
        stuff = 2
    }

    @IBAction func PlayerButton3(sender: AnyObject) {
        stuff = 3
    }
    
    @IBAction func PlayerButton4(sender: AnyObject) {
        stuff = 4
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! MapViewController
            dvc.numberOfPlayers = stuff

    }


}

