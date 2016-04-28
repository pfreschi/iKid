//
//  SecondViewController.swift
//  iKid
//
//  Created by Peter Freschi on 4/28/16.
//  Copyright © 2016 Peter Freschi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    private var secondJokeViewController : SecondJokeViewController!
    private var secondPunchlineViewController : SecondPunchlineViewController!
    
    private func secondJokeBuilder() {
        if secondJokeViewController == nil {
            secondJokeViewController =
                storyboard?
                    .instantiateViewControllerWithIdentifier("SecondJoke")
                as! SecondJokeViewController
        }
    }
    private func secondPunchlineBuilder() {
        if secondPunchlineViewController == nil {
            secondPunchlineViewController =
                storyboard?
                    .instantiateViewControllerWithIdentifier("SecondPunchline")
                as! SecondPunchlineViewController
        }
    }
    @IBAction func pressNext(sender: AnyObject) {
        secondPunchlineBuilder()
        secondJokeBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.EaseInOut)
        
        if secondJokeViewController != nil &&
            secondJokeViewController?.view.superview != nil {
            UIView.setAnimationTransition(.FlipFromRight, forView: view, cache: true)
            secondPunchlineViewController.view.frame = view.frame
            switchViewController(secondJokeViewController, to: secondPunchlineViewController)
        }
        else {
            UIView.setAnimationTransition(.FlipFromLeft, forView: view, cache: true)
            secondJokeViewController.view.frame = view.frame
            switchViewController(secondPunchlineViewController, to: secondJokeViewController)
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

