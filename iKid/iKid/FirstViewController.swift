//
//  FirstViewController.swift
//  iKid
//
//  Created by Peter Freschi on 4/28/16.
//  Copyright © 2016 Peter Freschi. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    private var firstJokeViewController : FirstJokeViewController!
    private var firstPunchlineViewController : FirstPunchlineViewController!
    
    private func firstJokeBuilder() {
        if firstJokeViewController == nil {
            firstJokeViewController =
                storyboard?
                    .instantiateViewControllerWithIdentifier("FirstJoke")
                as! FirstJokeViewController
        }
    }
    private func firstPunchlineBuilder() {
        if firstPunchlineViewController == nil {
            firstPunchlineViewController =
                storyboard?
                    .instantiateViewControllerWithIdentifier("FirstPunchline")
                as! FirstPunchlineViewController
        }
    }
    @IBAction func pressNext(sender: AnyObject) {
        firstPunchlineBuilder()
        firstJokeBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.EaseInOut)
        
        if firstJokeViewController != nil &&
            firstJokeViewController?.view.superview != nil {
            UIView.setAnimationTransition(.FlipFromRight, forView: view, cache: true)
            firstPunchlineViewController.view.frame = view.frame
            switchViewController(firstJokeViewController, to: firstPunchlineViewController)
        }
        else {
            UIView.setAnimationTransition(.FlipFromLeft, forView: view, cache: true)
            firstJokeViewController.view.frame = view.frame
            switchViewController(firstPunchlineViewController, to: firstJokeViewController)
        }
        UIView.commitAnimations()
    }
    
    
    private func switchViewController(from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMoveToParentViewController(nil)
            from!.view.removeFromSuperview()
            from!.removeFromParentViewController()
        }
        
        if to != nil {
            self.addChildViewController(to!)
            self.view.insertSubview(to!.view, atIndex: 0)
            to!.didMoveToParentViewController(self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

