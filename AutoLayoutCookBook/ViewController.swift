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
    
    
    func addViewOnTopSameSize(view:UIView){
        var new_view = UIView()
        new_view.setTranslatesAutoresizingMaskIntoConstraints(false)
        new_view.backgroundColor = UIColor.yellowColor()
        var metrics = ["height":50,"margin":10]
        self.view.addSubview(new_view)
        
        var views: NSMutableDictionary = NSMutableDictionary()
        views["new_view"] = new_view
        views["view"] = view
        
        
        
        var v_constrains  = NSLayoutConstraint.constraintsWithVisualFormat("V:[new_view(height)]-margin-[view]", options: NSLayoutFormatOptions(0), metrics: metrics, views: views)
        
        self.view.addConstraints(v_constrains)
        
        var h_constrains  = NSLayoutConstraint.constraintsWithVisualFormat("H:[new_view(==view)]", options: NSLayoutFormatOptions(0), metrics: metrics, views: views)
        
        self.view.addConstraints(h_constrains)
        
        
        
        var constX = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: new_view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        self.view.addConstraint(constX)
        
        UIView.animateWithDuration(1.0, animations:{ () in
            self.view.layoutIfNeeded()
        })

    
    }
    
    
    
    func addViewUnder(view:UIView){
        
        var new_view = UIView()
        new_view.frame = CGRect(x: 0, y: 0, width: 40, height: 20)
        new_view.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        new_view.backgroundColor = UIColor.greenColor()
        
        self.view.addSubview(new_view)
        var views: NSMutableDictionary = NSMutableDictionary()
        views["new_view"] = new_view
        views["view"] = view
        
        var metrics = ["height":new_view.frame.height,"width":new_view.frame.width,"margin":10]
        
        var v_constrains  = NSLayoutConstraint.constraintsWithVisualFormat("V:[view]-margin-[new_view(height)]", options: NSLayoutFormatOptions(0), metrics: metrics, views: views)
        
        self.view.addConstraints(v_constrains)
        
        var h_constrains  = NSLayoutConstraint.constraintsWithVisualFormat("H:[new_view(width)]", options: NSLayoutFormatOptions(0), metrics: metrics, views: views)
        
        self.view.addConstraints(h_constrains)
        
        
        var constX = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: new_view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        self.view.addConstraint(constX)
        
        UIView.animateWithDuration(1.0, animations:{ () in
            self.view.layoutIfNeeded()
        })


        
    }
    func addViewUnderSameSize(view:UIView){
    
        var new_view = UIView()
        new_view.setTranslatesAutoresizingMaskIntoConstraints(false)
        new_view.backgroundColor = UIColor.yellowColor()
        var metrics = ["height":50,"margin":10]
        self.view.addSubview(new_view)
        
        var views: NSMutableDictionary = NSMutableDictionary()
        views["new_view"] = new_view
        views["view"] = view
        
    
        
        var v_constrains  = NSLayoutConstraint.constraintsWithVisualFormat("V:[view]-margin-[new_view(height)]", options: NSLayoutFormatOptions(0), metrics: metrics, views: views)
        
        self.view.addConstraints(v_constrains)
        
        var h_constrains  = NSLayoutConstraint.constraintsWithVisualFormat("H:[new_view(==view)]", options: NSLayoutFormatOptions(0), metrics: metrics, views: views)
        
        self.view.addConstraints(h_constrains)
        
        
        
        var constX = NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: new_view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        self.view.addConstraint(constX)
        
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
        view.ezClearConstraints()
        view.ezRightCenter(margin: 10)
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
        self.removeRelatedConstraints()
        
        self.stayLow(self.move_button!)
    }

    @IBAction func sendTop(sender: AnyObject) {
        self.removeRelatedConstraints()
        
        self.move_button!.ezTopLeft(margin: 0)
        
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
}

