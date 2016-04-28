//
//  ThirdViewController.swift
//  iKid
//
//  Created by Peter Freschi on 4/28/16.
//  Copyright © 2016 Peter Freschi. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    private var thirdJokeViewController : ThirdJokeViewController!
    private var thirdPunchlineViewController : ThirdPunchlineViewController!
    
    private func thirdJokeBuilder() {
        if thirdJokeViewController == nil {
            thirdJokeViewController =
                storyboard?
                    .instantiateViewControllerWithIdentifier("ThirdJoke")
                as! ThirdJokeViewController
        }
    }
    private func thirdPunchlineBuilder() {
        if thirdPunchlineViewController == nil {
            thirdPunchlineViewController =
                storyboard?
                    .instantiateViewControllerWithIdentifier("ThirdPunchline")
                as! ThirdPunchlineViewController
        }
    }
    @IBAction func pressNext(sender: AnyObject) {
        thirdPunchlineBuilder()
        thirdJokeBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.EaseInOut)
        
        if thirdJokeViewController != nil &&
            thirdJokeViewController?.view.superview != nil {
            UIView.setAnimationTransition(.FlipFromRight, forView: view, cache: true)
            thirdPunchlineViewController.view.frame = view.frame
            switchViewController(thirdJokeViewController, to: thirdPunchlineViewController)
        }
        else {
            UIView.setAnimationTransition(.FlipFromLeft, forView: view, cache: true)
            thirdJokeViewController.view.frame = view.frame
            switchViewController(thirdPunchlineViewController, to: thirdJokeViewController)
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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
