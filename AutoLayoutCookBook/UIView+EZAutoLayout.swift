//
//  UIView+EZAutoLayout.swift
//  AutoLayoutCookBook
//
//  Created by Felipe Saint-Jean on 10/30/14.
//  Copyright (c) 2014 Test. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    func ezClearConstraints(){
        self.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        for c in self.superview!.constraints(){
            
            if let const = c as? NSLayoutConstraint {
                if (const.firstItem === self && (const.secondItem === self.superview || const.secondItem == nil) ){
                    self.superview!.removeConstraint(const)
                }else if (const.secondItem === self && (const.firstItem === self.superview)){
                    self.superview!.removeConstraint(const)
                }
                
            }
            
        }

        
        self.removeConstraints(self.constraints())
        
        
    }
    
    //MARK: Utility methods to position a view in reltion to it's parent with no size change
    
    
    func _alignSuperView(vertical:String, horizontal:String,margin: Int = 0,attribute:NSLayoutAttribute? = nil){
        self.ezClearConstraints()
        
        var metrics = ["width":self.frame.width,"height":self.frame.height,"margin":margin]
        
        
        var views: NSMutableDictionary = NSMutableDictionary()
        views["view"] = self
        
        var v_constrains  = NSLayoutConstraint.constraintsWithVisualFormat(vertical, options: NSLayoutFormatOptions(0), metrics: metrics as [NSObject : AnyObject], views: views as [NSObject : AnyObject])
        
        self.superview!.addConstraints(v_constrains)
        
        var h_constrains  = NSLayoutConstraint.constraintsWithVisualFormat(horizontal, options: NSLayoutFormatOptions(0), metrics: metrics as [NSObject : AnyObject], views: views as [NSObject : AnyObject])
        
        self.superview!.addConstraints(h_constrains)
    
        
        if let att = attribute{
            var constX = NSLayoutConstraint(item: self, attribute: att, relatedBy: NSLayoutRelation.Equal, toItem: self.superview, attribute: att, multiplier: 1, constant: 0)
            self.superview!.addConstraint(constX)
        }
        
        
    }

    func ezRight(margin: Int = 0){
       
        self._alignSuperView("V:[view(height)]", horizontal: "H:[view(width)]-margin-|", margin: margin, attribute: NSLayoutAttribute.CenterY)
        
    }
    
    func ezTop(margin: Int = 0){
        self._alignSuperView("V:|-margin-[view(height)]", horizontal: "H:[view(width)]", margin: margin, attribute: NSLayoutAttribute.CenterX)
        
    }
    
    func ezBottom(margin: Int = 0){
        self._alignSuperView("V:[view(height)]-margin-|", horizontal: "H:[view(width)]", margin: margin, attribute: NSLayoutAttribute.CenterX)

    }
    
    func ezLeft(margin: Int = 0){
        self._alignSuperView("V:[view(height)]", horizontal: "H:|-margin-[view(width)]", margin: margin, attribute: NSLayoutAttribute.CenterY)
        
    }
    
    func ezTopLeft(margin: Int = 0){
        self._alignSuperView("V:|-margin-[view(height)]", horizontal: "H:|-margin-[view(width)]", margin:margin)
        
    }
    
    func ezTopRight(margin: Int = 0){
        self._alignSuperView("V:|-margin-[view(height)]", horizontal: "H:[view(width)]-margin-|", margin:margin)
        
        
    }
    func ezBottomRight(margin: Int = 0){
        self._alignSuperView("V:[view(height)]-margin-|", horizontal: "H:[view(width)]-margin-|", margin:margin)
        
    }
    func ezBottomLeft(margin: Int = 0){
        self._alignSuperView("V:[view(height)]-margin-|", horizontal: "H:|-margin-[view(width)]", margin:margin)
        
    }
   
    
    
    func ezCenter(width:Int? = nil, height:Int? = nil){
        self.ezClearConstraints()
        
        var views: NSMutableDictionary = NSMutableDictionary()
        views["view"] = self
        var metrics = [
            "width": (width != nil ? width! : Int(self.frame.width)),
            "height": (height != nil ? height! : Int(self.frame.height))
        ]
        
        
        
        
        
        
        var v_constrains  = NSLayoutConstraint.constraintsWithVisualFormat("V:[view(height)]", options: NSLayoutFormatOptions(0), metrics: metrics, views: views as [NSObject : AnyObject])
        
        self.superview!.addConstraints(v_constrains)
        
        var h_constrains  = NSLayoutConstraint.constraintsWithVisualFormat("H:[view(width)]", options: NSLayoutFormatOptions(0), metrics: metrics, views: views as [NSObject : AnyObject])
        
        self.superview!.addConstraints(h_constrains)
        
        
        var constX = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.superview, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        self.superview!.addConstraint(constX)
        
        var constY = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.superview, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
        self.superview!.addConstraint(constY)
        
    
    }
    
    
    //MARK: Utility methods to position a view in reltion to it's parent and match parent size
    
    
    func ezFill(margin: Int = 0){
        self.ezClearConstraints()
        var views: NSMutableDictionary = NSMutableDictionary()
        views["view"] = self
        
        var metrics = ["margin":margin]

        
        var v_constrains  = NSLayoutConstraint.constraintsWithVisualFormat("V:|-margin-[view]-margin-|", options: NSLayoutFormatOptions(0), metrics: metrics, views: views as [NSObject : AnyObject])
        
        self.superview!.addConstraints(v_constrains)
        
        var h_constrains  = NSLayoutConstraint.constraintsWithVisualFormat("H:|-margin-[view]-margin-|", options: NSLayoutFormatOptions(0), metrics: metrics, views: views as [NSObject : AnyObject])
        
        self.superview!.addConstraints(h_constrains)
    
    }
    
    func ezTopFill(margin: Int = 0){
        self.ezClearConstraints()
        var views: NSMutableDictionary = NSMutableDictionary()
        views["view"] = self
        
        var metrics = ["margin":margin,"height":self.frame.height]
        
        
        var v_constrains  = NSLayoutConstraint.constraintsWithVisualFormat("V:|-margin-[view(height)]", options: NSLayoutFormatOptions(0), metrics: metrics as [NSObject : AnyObject], views: views as [NSObject : AnyObject])
        
        self.superview!.addConstraints(v_constrains)
        
        var h_constrains  = NSLayoutConstraint.constraintsWithVisualFormat("H:|-margin-[view]-margin-|", options: NSLayoutFormatOptions(0), metrics: metrics as [NSObject : AnyObject], views: views as [NSObject : AnyObject])
        
        self.superview!.addConstraints(h_constrains)
    }
    
    func ezLeftFill(margin: Int = 0){
        self._alignSuperView("V:|-margin-[view]-margin-|", horizontal: "H:|-margin-[view(width)]", margin: 5)
    }
    
    func ezRightFill(margin: Int = 0){
        self._alignSuperView("V:|-margin-[view]-margin-|", horizontal: "H:[view(width)]-margin-|", margin: 5)
    }
    
    func ezBottomFill(margin: Int = 0){
        self.ezClearConstraints()
        var views: NSMutableDictionary = NSMutableDictionary()
        views["view"] = self
        var metrics = ["width":self.frame.width,"height":self.frame.height,"margin":margin]
        
        var v_constrains  = NSLayoutConstraint.constraintsWithVisualFormat("V:[view(height)]-margin-|", options: NSLayoutFormatOptions(0), metrics: metrics as [NSObject : AnyObject], views: views as [NSObject : AnyObject])
        
        self.superview!.addConstraints(v_constrains)
        
        var h_constrains  = NSLayoutConstraint.constraintsWithVisualFormat("H:|-margin-[view]-margin-|", options: NSLayoutFormatOptions(0), metrics: metrics as [NSObject : AnyObject], views: views as [NSObject : AnyObject])
        
        self.superview!.addConstraints(h_constrains)

    }
    
    
    //MARK: Utility methods to position a view in reltion to a sibling

    func _sameSizeXAligned(view:UIView,vertical:String, horizontal:String,margin: Int = 0,attribute:NSLayoutAttribute){
        self.ezClearConstraints()
        
        var metrics = ["width":self.frame.width,"height":self.frame.height,"margin":margin]
        
        
        var views: NSMutableDictionary = NSMutableDictionary()
        views["under"] = self
        views["view"] = view
        
        var v_constrains  = NSLayoutConstraint.constraintsWithVisualFormat(vertical, options: NSLayoutFormatOptions(0), metrics: metrics as [NSObject : AnyObject], views: views as [NSObject : AnyObject])
        
        self.superview!.addConstraints(v_constrains)
        
        var h_constrains  = NSLayoutConstraint.constraintsWithVisualFormat(horizontal, options: NSLayoutFormatOptions(0), metrics: metrics as [NSObject : AnyObject], views: views as [NSObject : AnyObject])
        
        self.superview!.addConstraints(h_constrains)
        
        
        
        var constX = NSLayoutConstraint(item: view, attribute: attribute, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: attribute, multiplier: 1, constant: 0)
        self.superview!.addConstraint(constX)
        
        
        
    }

   
    func ezSetUnder(view:UIView,margin: Int = 0){
        self._sameSizeXAligned(view, vertical: "V:[view]-margin-[under(height)]", horizontal: "H:[under(width)]", margin: margin,attribute:NSLayoutAttribute.CenterX)
        
    }
    
    func ezSetOver(view:UIView,margin: Int = 0){
        self._sameSizeXAligned(view, vertical: "V:[under(height)]-margin-[view]", horizontal: "H:[under(width)]", margin: margin,attribute:NSLayoutAttribute.CenterX)
        
        
    }
    
    func ezSetLeftOf(view:UIView,margin: Int = 0){
        self._sameSizeXAligned(view, vertical: "V:[under(height)]", horizontal: "H:[view]-margin-[under(width)]", margin: margin,attribute:NSLayoutAttribute.CenterY)
        
        
    }

    func ezSetRightOf(view:UIView,margin: Int = 0){
        self._sameSizeXAligned(view, vertical: "V:[under(height)]", horizontal: "H:[under(width)]-margin-[view]", margin: margin,attribute:NSLayoutAttribute.CenterY)
        
        
    }
    
    
    func ezSetUnderMatch(view:UIView,margin: Int = 0){
        self._sameSizeXAligned(view, vertical: "V:[view]-margin-[under(height)]", horizontal: "H:[under(==view)]", margin: margin,attribute:NSLayoutAttribute.CenterX)
        
    }
    
    func ezSetOverMatch(view:UIView,margin: Int = 0){
        self._sameSizeXAligned(view, vertical: "V:[under(height)]-margin-[view]", horizontal: "H:[under(==view)]", margin: margin,attribute:NSLayoutAttribute.CenterX)
        
        
    }
    
    func ezSetLeftOfMatch(view:UIView,margin: Int = 0){
        self._sameSizeXAligned(view, vertical: "V:[under(==view)]", horizontal: "H:[view]-margin-[under(width)]", margin: margin,attribute:NSLayoutAttribute.CenterY)
        
        
    }
    
    func ezSetRightOfMatch(view:UIView,margin: Int = 0){
        self._sameSizeXAligned(view, vertical: "V:[under(==view)]", horizontal: "H:[under(width)]-margin-[view]", margin: margin,attribute:NSLayoutAttribute.CenterY)
        
        
    }



    
    func ezAnimateChage(){
        UIView.animateWithDuration(1.0, animations:{ () in
            self.superview!.layoutIfNeeded()
        })

    }

    

}