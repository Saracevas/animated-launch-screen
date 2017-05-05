//
//  LoginViewController.swift
//  Yemekbaz
//
//  Created by Sylvester Saracevas on 04/05/2017.
//  Copyright © 2017 Sylvester Saracevas. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
	
	var scrollView: UIScrollView!
	var imageView: UIImageView!
	
	@IBOutlet weak var usernameField: UITextField!
	@IBOutlet weak var passwordField: UITextField!
	@IBOutlet weak var loginButton: UIButton!
	
	@IBOutlet weak var logoTopConstraint: NSLayoutConstraint!
	@IBOutlet weak var logoBottomConstraint: NSLayoutConstraint!
	@IBOutlet weak var logoRightConstraint: NSLayoutConstraint!
	@IBOutlet weak var logoLeftConstraint: NSLayoutConstraint!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		usernameField.alpha = 0.0
		passwordField.alpha = 0.0
		loginButton.alpha = 0.0
		
		self.logoTopConstraint.constant = 265
		self.logoBottomConstraint.constant = 285
		
		displayAndAnimateBackground()
    }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		animateLogo()

	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
	
	private func animateLogo() {
		
		self.view.layoutIfNeeded()
		
		UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
			self.logoTopConstraint.constant = 151
			self.logoBottomConstraint.constant = 399
			self.view.layoutIfNeeded()
		}, completion: nil)

		UIView.animate(withDuration: 0.5, delay: 0.5, options: UIViewAnimationOptions.curveEaseOut, animations: {
			self.usernameField.alpha = 1.0
			self.passwordField.alpha = 1.0
			self.loginButton.alpha = 1.0
		}, completion: nil)

	}
	
	/// Create an animated background from splash image.
	private func displayAndAnimateBackground() {
		
		let screenSize: CGRect = UIScreen.main.bounds
		
		//Create the splash image view
		imageView = UIImageView(image: #imageLiteral(resourceName: "Splash2"))
		imageView.contentMode = .scaleAspectFill
		imageView.frame.size.height = screenSize.height
		imageView.alpha = 0
		
		// Create the scroll view
		scrollView = UIScrollView(frame: view.bounds)
		scrollView.contentSize = imageView.bounds.size
		
		// Add the views so we can see them.
		self.scrollView.addSubview(self.imageView)
		self.view.addSubview(self.scrollView)
		self.view.sendSubview(toBack: self.scrollView)
		
		UIView.animate(withDuration: 4, animations: {
			// Remove the background color which was set in Interface Builder
			// to make it easier to see what the layout on the interface builder.
			self.imageView.alpha = 1
		})
		
		// Animate the scrolling background
		let bottomOffset = CGPoint(x: self.scrollView.contentSize.width - self.scrollView.bounds.size.width, y: 0.0);
		UIView.animate(withDuration: 60, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
			self.scrollView.setContentOffset(bottomOffset, animated: false)
		})
		UIView.animate(withDuration: 60, delay: 60, options: UIViewAnimationOptions.curveLinear, animations: {
			self.scrollView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: false)
		})
		
	}

}
