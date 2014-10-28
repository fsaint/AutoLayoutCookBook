//
//  ViewController.swift
//  AutoLayoutCookBook
//
//  Created by Felipe Saint-Jean on 10/28/14.
//  Copyright (c) 2014 Test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var move_button: UIButton!
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
        
        for c in self.view.constraints(){
            
            if let const = c as? NSLayoutConstraint {
                if (const.firstItem === self.move_button!){
                    self.view.removeConstraint(const)
                }
                
                if (const.secondItem === self.move_button!){
                    self.view.removeConstraint(const)
                }
                
            }
            
            
            
        }
        
        self.move_button!.removeConstraints(self.move_button!.constraints())
        
        self.move_button!.setTranslatesAutoresizingMaskIntoConstraints(false)
    }
    
   
    
    func fillWithMargin(view:UIView){
        var views: NSMutableDictionary = NSMutableDictionary()
        views["view"] = view
        
        var v_constrains  = NSLayoutConstraint.constraintsWithVisualFormat("V:|-10-[view]-10-|", options: NSLayoutFormatOptions(0), metrics: nil, views: views)
        
        self.view.addConstraints(v_constrains)
        
        var h_constrains  = NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[view]-10-|", options: NSLayoutFormatOptions(0), metrics: nil, views: views)
        
        self.view.addConstraints(h_constrains)
        
        
        UIView.animateWithDuration(1.0, animations:{ () in
            self.view.layoutIfNeeded()
        })

    }
    
    func stayLow(view:UIView){
        var views: NSMutableDictionary = NSMutableDictionary()
        views["view"] = view
        
        var v_constrains  = NSLayoutConstraint.constraintsWithVisualFormat("V:[view(50)]-10-|", options: NSLayoutFormatOptions(0), metrics: nil, views: views)
        
        self.view.addConstraints(v_constrains)
        
        var h_constrains  = NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[view]-10-|", options: NSLayoutFormatOptions(0), metrics: nil, views: views)
        
        self.view.addConstraints(h_constrains)
        
        
        UIView.animateWithDuration(1.0, animations:{ () in
            self.view.layoutIfNeeded()
        })
        
    }

    func goHigh(view:UIView){
        var views: NSMutableDictionary = NSMutableDictionary()
        views["view"] = view
        
        
        var metrics = ["margin":10,"height":50]
        
        
        var v_constrains  = NSLayoutConstraint.constraintsWithVisualFormat("V:|-margin-[view(height)]", options: NSLayoutFormatOptions(0), metrics: metrics, views: views)
        
        self.view.addConstraints(v_constrains)
        
        var h_constrains  = NSLayoutConstraint.constraintsWithVisualFormat("H:|-margin-[view]-margin-|", options: NSLayoutFormatOptions(0), metrics: metrics, views: views)
        
        self.view.addConstraints(h_constrains)
        
        
        UIView.animateWithDuration(1.0, animations:{ () in
            self.view.layoutIfNeeded()
        })

    }
    
    func center(view:UIView){
        
        
        var views: NSMutableDictionary = NSMutableDictionary()
        views["view"] = view
        
        
        var v_constrains  = NSLayoutConstraint.constraintsWithVisualFormat("V:[view(50)]", options: NSLayoutFormatOptions(0), metrics: nil, views: views)
        
        self.view.addConstraints(v_constrains)
        
        var h_constrains  = NSLayoutConstraint.constraintsWithVisualFormat("H:[view(200)]", options: NSLayoutFormatOptions(0), metrics: nil, views: views)
        
        self.view.addConstraints(h_constrains)
        
        
        var constX = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        self.view.addConstraint(constX)
        
        var constY = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
        self.view.addConstraint(constY)
        
        
        UIView.animateWithDuration(1.0, animations:{ () in
            self.view.layoutIfNeeded()
        })
    
    }
    @IBAction func centerAction(sender: AnyObject) {
        self.removeRelatedConstraints()
        
        self.center(self.move_button!)
        
    }
    
    @IBAction func sendBotom(sender: AnyObject) {
        self.removeRelatedConstraints()
        
        self.stayLow(self.move_button!)
    }

    @IBAction func sendTop(sender: AnyObject) {
        self.removeRelatedConstraints()
        
        self.goHigh(self.move_button!)
    }
   
    @IBAction func addSon(sender: AnyObject) {
        
        var son = UIView()
        
        son.backgroundColor = UIColor.yellowColor()
        
        
    }
    
    @IBAction func applyContrains(sender: AnyObject) {
        
        self.removeRelatedConstraints()
        self.fillWithMargin(self.move_button!)
      
    }
}

