//
//  ViewController.swift
//  AutoLayoutCookBook
//
//  Created by Felipe Saint-Jean on 10/28/14.
//  Copyright (c) 2014 Test. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet var one: UIView!
    @IBOutlet var two: UIView!
    @IBOutlet weak var move_button: UIButton!
    @IBOutlet var four: UIView!
    @IBOutlet var three: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // One Tap
        let tap = UITapGestureRecognizer(target: self, action: Selector("tapDelected:"))
        tap.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tap)
        
        // Double Tap
        let dtap = UITapGestureRecognizer(target: self, action: Selector("doubleTapDelected:"))
        dtap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(dtap)
        tap.requireGestureRecognizerToFail(dtap)
        
        
    }

    func doubleTapDelected(gesture:UITapGestureRecognizer){
        var point = gesture.locationInView(self.view)
        
        self.move_button!.ezClearConstraints()
        
        var w3 = self.view.frame.width / 3.0
        var h3 = self.view.frame.height/3.0
        
        if point.y < h3{
            self.move_button!.ezTopFill(10)
            
        }else if (point.y > 2*h3){
            self.move_button!.ezBottomFill(10)
        }else if (point.x < w3){
            self.move_button!.ezLeftFill(10)
        }else if (point.x > 2*w3){
            self.move_button!.ezRightFill(10)
        }else{
            self.move_button!.ezFill(10)
        }
        
        self.move_button!.ezAnimateChage()
        

    }
    func tapDelected(gesture:UITapGestureRecognizer){
        var point = gesture.locationInView(self.view)
        
        var w3 = self.view.frame.width / 3.0
        var h3 = self.view.frame.height/3.0
        
        if point.x < w3  && point.y < h3 {
            self.move_button!.ezTopLeft(5)
        }else if point.x < 2 * w3 && point.y < h3{
            self.move_button!.ezTop(5)
        }else if point.x > 2 * w3 && point.y < h3{
            self.move_button!.ezTopRight(5)
        } else if point.x < w3 &&   point.y > 2 * h3{
            self.move_button!.ezBottomLeft(5)
        }else if point.x < 2 * w3 &&   point.y > 2 * h3{
            self.move_button!.ezBottom(5)
        }else if point.x > 2 * w3 &&  point.y > 2 * h3{
            self.move_button!.ezBottomRight(5)
        }else if point.x < w3 && point.y >  h3{
            self.move_button!.ezLeft(5)
        }else if point.x > 2 * w3 && point.y >  h3{
            self.move_button!.ezRight(5)
        }else{
            self.move_button!.ezCenter()
        }
        
        
        self.move_button!.ezAnimateChage()

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var applyContrain: UIButton!

    
    func removeRelatedConstraints(){
            self.move_button!.ezClearConstraints()
    }
    
    func fillWithMargin(view:UIView){
        self.move_button!.ezFill(10)
        self.move_button!.ezAnimateChage()
    }
    
    func stayLow(view:UIView){
        self.move_button!.ezBottomFill(5)
        self.move_button!.ezAnimateChage()
    }

    func goHigh(view:UIView){
        self.move_button!.ezTopFill(5)
        self.move_button!.ezAnimateChage()
    }
    
   
    @IBAction func centerAction(sender: AnyObject) {
        self.move_button!.ezCenter(200,height:100)
        self.move_button!.ezAnimateChage()
    }
    
    @IBAction func detatch(sender: AnyObject) {
        self.one!.ezTopLeft(0)
        self.two!.ezTopRight(0)
        self.three!.ezBottomLeft(0)
        self.four!.ezBottomRight(0)
        self.view.ezAnimateChage()
        
    }
    
    @IBAction func addUnder(sender: AnyObject) {
    /*
        self.move_button!.ezCenter()
        self.two!.ezSetUnder(self.move_button!, margin: 0)
        self.one!.ezSetOver(self.move_button!, margin: 0)
        self.three!.ezSetRightOf(self.move_button!, margin: 0)
        self.four!.ezSetLeftOf(self.move_button!, margin: 0)
        self.two!.ezAnimateChage()
        */
        
        self.move_button!.ezCenter()
        self.two!.ezSetUnderMatch(self.move_button!, margin: 0)
        self.one!.ezSetOverMatch(self.move_button!, margin: 0)
        self.three!.ezSetRightOfMatch(self.move_button!, margin: 0)
        self.four!.ezSetLeftOfMatch(self.move_button!, margin: 0)
        self.two!.ezAnimateChage()
        
        

    }
 }

