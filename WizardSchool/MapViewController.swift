//
//  MapViewController.swift
//  WizardSchool
//
//  Created by kcarter on 4/17/15.
//  Copyright (c) 2015 kcarter. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UICollisionBehaviorDelegate {
    var spaces : UIView!
    var peices1: UIView!
    var peices2: UIView!
    var peices3: UIView!
    var peices4: UIView!
    var peicesArray = [UIView]()
    var spaceArray = [UIView]()
    var allViews = [UIView]()
    var dynamicAnimator = UIDynamicAnimator()
    var spaceBehavior = UIDynamicItemBehavior()
    var peicesBehavior = UIDynamicItemBehavior()
    var collisonBehavior = UICollisionBehavior()
    var numberOfPlayers = Int()
    var whosTurn = UIView()
    var whatPlayer = players()
    var player1 = players()
    var player2 = players()
    var player3 = players()
    var player4 = players()
    var targetPlayer = players()
    

    override func viewDidLoad()
    
    {
        super.viewDidLoad()
        makeBoard()
        whosTurn = peices1
        whatPlayer = player1
    }
    
    @IBAction func movePeice(sender: UIPanGestureRecognizer)
    {
        if whatPlayer.stunned == 0{
        whosTurn.center = CGPointMake(sender.locationInView(view).x,sender.locationInView(view).y)
        dynamicAnimator.updateItemUsingCurrentState(whosTurn)
        }
        else
        {
            if whosTurn == peices1
            {
                whosTurn = peices2
                whatPlayer.stunned = 0
                whatPlayer = player2
            }
            else if whosTurn == peices2 && numberOfPlayers == 3 || numberOfPlayers == 4
            {
                whosTurn = peices3
                whatPlayer.stunned = 0
                whatPlayer = player3

            }
            else if numberOfPlayers == 4
            {
                whosTurn = peices4
                whatPlayer.stunned = 0
                whatPlayer = player4

            }
            else
            {
                whosTurn = peices1
                whatPlayer.stunned = 0
                whatPlayer = player1
                

            }

        }
    }
   
    
    func makePathStuff(var height: Int, var color: UIColor, var brickNumber: Int, var space: Int, var Hard: CGFloat)
    {
        var count = space
        for (var i = 0; i < brickNumber; i++)
        {
            spaces = UIView(frame: CGRectMake (view.center.x + CGFloat(count)  , CGFloat(height), 80, 20))
            spaces.backgroundColor = color
            spaces.alpha = Hard
            spaces.layer.masksToBounds = true
            allViews.append(spaces)
            spaceArray.append(spaces)
            view.addSubview(spaces)
            count -= 90
        }
        
    }
    
    @IBAction func nextTurn(sender: AnyObject) {
        if whosTurn == peices1
        {
            whosTurn = peices2
            whatPlayer = player2
        }
        else if whosTurn == peices2 && numberOfPlayers == 3 || numberOfPlayers == 4
        {
            whosTurn = peices3
            whatPlayer = player3
        }
        else if numberOfPlayers == 4
        {
            whosTurn = peices4
            whatPlayer = player4
        }
        else
        {
            whosTurn = peices1
            whatPlayer = player1
        }
    }
    
    func makeBoard()
    {
        makePathStuff(85, color: UIColor.greenColor(), brickNumber: 7, space: 360   , Hard: 1)
        makePathStuff(115, color: UIColor.greenColor(), brickNumber: 7, space: 360   , Hard: 1)
        makePathStuff(145, color: UIColor.greenColor(), brickNumber: 6, space: 90  , Hard: 1)
        

        peices1 = UIView(frame: CGRectMake(CGFloat(170), CGFloat(91), 10, 10))
        peices1.backgroundColor = UIColor.blackColor()
        peices1.layer.masksToBounds = true
        peices1.bringSubviewToFront(peices1)
        allViews.append(peices1)
        peicesArray.append(peices1)
        view.addSubview(peices1)
        
        player1 = players(str: 1, dex: 1, wil: 1, peice: peices1, stunned: 0, id: 1, trapLvl: 1)
        
        peices2 = UIView(frame: CGRectMake(CGFloat(170), CGFloat(91), 10, 10))
        peices2.backgroundColor = UIColor.redColor()
        peices2.layer.masksToBounds = true
        peices2.bringSubviewToFront(peices2)
        allViews.append(peices2)
        peicesArray.append(peices2)
        view.addSubview(peices2)
        
        player2 = players(str: 1, dex: 1, wil: 1, peice: peices2, stunned: 0, id: 2, trapLvl: 1)

        
        if(numberOfPlayers == 3 || numberOfPlayers == 4){
        peices3 = UIView(frame: CGRectMake(CGFloat(170), CGFloat(91), 10, 10))
        peices3.backgroundColor = UIColor.blueColor()
        peices3.layer.masksToBounds = true
        peices3.bringSubviewToFront(peices3)
        allViews.append(peices3)
        peicesArray.append(peices3)
        view.addSubview(peices3)
            
            player3 = players(str: 1, dex: 1, wil: 1, peice: peices3, stunned: 0, id: 3, trapLvl: 1)

        }
        
        if(numberOfPlayers == 4)
        {
        peices4 = UIView(frame: CGRectMake(CGFloat(170), CGFloat(91), 10, 10))
        peices4.backgroundColor = UIColor.purpleColor()
        peices4.layer.masksToBounds = true
        peices4.bringSubviewToFront(peices4)
        allViews.append(peices4)
        peicesArray.append(peices4)
        view.addSubview(peices4)
            
            player4 = players(str: 1, dex: 1, wil: 1, peice: peices4, stunned: 0, id: 4, trapLvl: 1)

        }
         
        spaceBehavior = UIDynamicItemBehavior(items: spaceArray)
        spaceBehavior.density = 0
        spaceBehavior.elasticity = 1.0
        spaceBehavior.allowsRotation = false
        dynamicAnimator.addBehavior(spaceBehavior)
        
        peicesBehavior = UIDynamicItemBehavior(items: [peices1])
        peicesBehavior.density = 0
        peicesBehavior.elasticity = 1.0
        peicesBehavior.allowsRotation = false
        dynamicAnimator.addBehavior(peicesBehavior)

    }

    @IBAction func enterRoom(sender: AnyObject) {
        
        var roll1 =  Int(arc4random_uniform(3)) + 1
        println(roll1)
    
        if roll1 == 1
            {
                println(title)
                let alert = UIAlertController(title: makeTitle() as String, message: nil, preferredStyle: UIAlertControllerStyle.Alert)
                let alertAction = UIAlertAction(title: "fight", style: UIAlertActionStyle.Default)
                    {
                        (action) -> Void in
                        roll1 = Int(arc4random_uniform(10)) + 1
                        if roll1 > self.whatPlayer.str
                        {
                            let alert2 = UIAlertController(title: "The monster beats you making you run away.", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
                            let alertAction2 = UIAlertAction(title: "Back", style: UIAlertActionStyle.Default)
                                {
                                    (action) -> Void in
                                }
                                  alert2.addAction(alertAction2)
                            self.presentViewController(alert2, animated: true, completion: nil)
                        }
                        
                        else
                        {
                            let alert2 = UIAlertController(title: "You smack the monster around and win", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
                            let alertAction2 = UIAlertAction(title: "lvl+", style: UIAlertActionStyle.Default)
                                {
                                    (action) -> Void in
                                    var roll1 = Int(arc4random_uniform(3)) + 1
                                    if roll1 == 1
                                    {
                                        self.whatPlayer.str++
                                        println(self.whatPlayer.str)
                                    }
                                    else if roll1 == 2
                                    {
                                        self.whatPlayer.dex++
                                        println(self.whatPlayer.dex)
                                    }
                                   else
                                    {
                                        self.whatPlayer.wil++
                                        println(self.whatPlayer.wil)
                                    }
                                }
                            alert2.addAction(alertAction2)
                            self.presentViewController(alert2, animated: true, completion: nil)

                        }
                    
                
                }
                alert.addAction(alertAction)
                presentViewController(alert, animated: true, completion: nil)
            }
        
        if roll1 == 2
        {
            println(title)
            let alert = UIAlertController(title: makeTitle2() as String, message: nil, preferredStyle: UIAlertControllerStyle.Alert)
            let alertAction = UIAlertAction(title: "escape", style: UIAlertActionStyle.Default)
                {
                    (action) -> Void in
                    roll1 = Int(arc4random_uniform(10)) + 1
                    if roll1 > self.whatPlayer.str
                    {
                        let alert2 = UIAlertController(title: "The trap grabs you delaying you for turn.", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
                        let alertAction2 = UIAlertAction(title: "Get stuck gain 1/2 lvl", style: UIAlertActionStyle.Default)
                            {
                                (action) -> Void in
                                self.whatPlayer.stunned = 1
                                if (self.whatPlayer.trapLvl%2 == 0)
                                {
                                    var roll1 = Int(arc4random_uniform(3)) + 1
                                    if roll1 == 1
                                    {
                                        self.whatPlayer.str++
                                        println(self.whatPlayer.str)
                                    }
                                    else if roll1 == 2
                                    {
                                        self.whatPlayer.dex++
                                        println(self.whatPlayer.dex)
                                    }
                                    else
                                    {
                                        self.whatPlayer.wil++
                                        println(self.whatPlayer.wil)
                                    }

                                }
                                else
                                {
                                    self.whatPlayer.trapLvl++ 
                                }
                        }
                        alert2.addAction(alertAction2)
                        self.presentViewController(alert2, animated: true, completion: nil)
                    }
                        
                    else
                    {
                        let alert2 = UIAlertController(title: "You manage to avoid the trap", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
                        let alertAction2 = UIAlertAction(title: "lvl+", style: UIAlertActionStyle.Default)
                            {
                                (action) -> Void in
                                var roll1 = Int(arc4random_uniform(3)) + 1
                                if roll1 == 1
                                {
                                    self.whatPlayer.str++
                                    println(self.whatPlayer.str)
                                }
                                else if roll1 == 2
                                {
                                    self.whatPlayer.dex++
                                    println(self.whatPlayer.dex)
                                }
                                else
                                {
                                    self.whatPlayer.wil++
                                    println(self.whatPlayer.wil)
                                }
                        }
                        alert2.addAction(alertAction2)
                        self.presentViewController(alert2, animated: true, completion: nil)
                        
                    }
                    
                    
            }
            alert.addAction(alertAction)
            presentViewController(alert, animated: true, completion: nil)
            
        }
        if roll1 == 3
        {
            println(title)
            let alert = UIAlertController(title: "You find an Altar", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
            let alertAction = UIAlertAction(title: "use", style: UIAlertActionStyle.Default)
                {
                    (action) -> Void in
                        let alert2 = UIAlertController(title: "What player will you delay?", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
                        let alertAction2 = UIAlertAction(title: "player1", style: UIAlertActionStyle.Default)
                            {
                                (action) -> Void in
                                roll1 = Int(arc4random_uniform(10)) + 1
                                if self.player1.wil < roll1
                                {
                                    self.player1.stunned = 1
                                    println(self.player1.stunned)
                                }
                            }
                                let alertAction3 = UIAlertAction(title: "player2", style: UIAlertActionStyle.Default)
                                    {
                                        (action) -> Void in
                                        roll1 = Int(arc4random_uniform(10)) + 1
                                        if self.player1.wil < roll1
                                        {
                                            self.player2.stunned = 1
                                            println(self.player2.stunned)

                                        }
                                    }
                                        let alertAction4 = UIAlertAction(title: "player3", style: UIAlertActionStyle.Default)
                                            {
                                                (action) -> Void in
                                                roll1 = Int(arc4random_uniform(10)) + 1
                                                if self.player3.wil < roll1
                                                {
                                                    self.player3.stunned = 1
                                                    println(self.player3.stunned)

                                                }
                                            }
                                                let alertAction5 = UIAlertAction(title: "player4", style: UIAlertActionStyle.Default)
                                                    {
                                                        (action) -> Void in
                                                        roll1 = Int(arc4random_uniform(10)) + 1
                                                        if self.player4.wil < roll1
                                                        {
                                                            self.player4.stunned = 1
                                                            println(self.player4.stunned)

                                                        }
                                                    }
                                                    alert2.addAction(alertAction2)
                                                    alert2.addAction(alertAction3)
                                                    alert2.addAction(alertAction4)
                                                    alert2.addAction(alertAction5)
                                                    self.presentViewController(alert2, animated: true, completion: nil)
                                                }
                        
            
            
            alert.addAction(alertAction)
            presentViewController(alert, animated: true, completion: nil)
        }
        

    }
    
    func makeTitle() -> NSString
    {
        var roll1 = Int(arc4random_uniform(10)) + 1
        var title = "hi"
        if roll1 >= 5
        {
            return "A strong monster appears."

        }
        else
        {
            return " A weak monster appears."
    
        }
    }
    
    func makeTitle2() -> NSString
    {
        var roll1 = Int(arc4random_uniform(10)) + 1
        var title = "hi"
        if roll1 >= 5
        {
            return "A cleaver trap springs."
            
        }
        else
        {
            return " A smiple trap springs."
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! CharacterSheets
        dvc.whatChar = whatPlayer


}



