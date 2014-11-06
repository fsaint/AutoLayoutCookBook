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
        self.move_button!.ezFill(margin: 10)
        self.move_button!.ezAnimateChage()
    }
    
    func stayLow(view:UIView){
        self.move_button!.ezBottomFill(margin: 5)
        self.move_button!.ezAnimateChage()
    }

    func goHigh(view:UIView){
        self.move_button!.ezTopFill(margin: 5)
        self.move_button!.ezAnimateChage()
    }
    
    func center(view:UIView){
        view.ezClearConstraints()
        view.ezRight(margin: 10)
        view.ezAnimateChage()
    }
    @IBAction func centerAction(sender: AnyObject) {
        self.removeRelatedConstraints()
        self.center(self.move_button!)
    }
    
    
    @IBAction func addUnder(sender: AnyObject) {
        
        //self.addViewUnderSameSize(self.move_button!)
        //self.addViewOnTopSameSize(self.move_button!)
        //self.addViewUnder(self.move_button!)
        
        self.move_button!.ezCenter()
        self.two!.ezSetUnder(self.move_button!, margin: 0)
        self.one!.ezSetOver(self.move_button!, margin: 0)
        self.three!.ezSetRightOf(self.move_button!, margin: 0)
        self.four!.ezSetLeftOf(self.move_button!, margin: 0)
        self.two!.ezAnimateChage()
    }
    @IBAction func sendBotom(sender: AnyObject) {
        
        self.move_button!.ezBottomFill(margin: 5)
        self.move_button!.ezAnimateChage()
    }

    @IBAction func sendTop(sender: AnyObject) {
        self.removeRelatedConstraints()
        
        //self.move_button!.ezTopFill(margin: 5)
        self.move_button!.ezRightFill(margin: 5)
        self.move_button!.ezAnimateChage()
    }
   
    @IBAction func addSon(sender: AnyObject) {
        
        var son = UIView()
        
        son.backgroundColor = UIColor.yellowColor()
        
        
    }
    
    @IBAction func applyContrains(sender: AnyObject) {
        
        self.removeRelatedConstraints()
        self.fillWithMargin(self.move_button!)
      
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        var point: CGPoint = touches.anyObject()!.locationInView(self.view)
        
        var w3 = self.view.frame.width / 3.0
        var h3 = self.view.frame.height/3.0
        
        if point.x < w3  && point.y < h3 {
            self.move_button!.ezTopLeft(margin: 5)
        }else if point.x < 2 * w3 && point.y < h3{
            self.move_button!.ezTop(margin: 5)
        }else if point.x > 2 * w3 && point.y < h3{
            self.move_button!.ezTopRight(margin: 5)
        } else if point.x < w3 &&   point.y > 2 * h3{
            self.move_button!.ezBottomLeft(margin: 5)
        }else if point.x < 2 * w3 &&   point.y > 2 * h3{
            self.move_button!.ezBottom(margin: 5)
        }else if point.x > 2 * w3 &&  point.y > 2 * h3{
            self.move_button!.ezBottomRight(margin: 5)
        }else if point.x < w3 && point.y >  h3{
            self.move_button!.ezLeft(margin: 5)
        }else if point.x > 2 * w3 && point.y >  h3{
            self.move_button!.ezRight(margin: 5)
        }else{
            self.move_button!.ezCenter()
        }
        
        
        self.move_button!.ezAnimateChage()
    }
}

