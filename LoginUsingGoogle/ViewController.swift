//
//  ViewController.swift
//  LoginUsingGoogle
//
//  Created by Abdalla on 10/17/19.
//  Copyright © 2019 edu.data. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {

    @IBOutlet weak var loginUsingGoogle: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginUsingGoogle.addTarget(self, action: #selector(loginGoogle(_:)), for: .touchUpInside)
    }

    @IBAction func loginGoogle(_ sender: Any) {
        if loginUsingGoogle.title(for: .normal) == "Sign Out"
        {
            GIDSignIn.sharedInstance()?.signOut()
            lblTitle.text = ""
        }
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.uiDelegate = self
        GIDSignIn.sharedInstance()?.signIn()
    }
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if let error = error
        {
            print("We have an error ==\(error.localizedDescription)")
        }
        else
        {
            if let gmailUser = user
            {
              lblTitle.text = "You are sign in using id \(gmailUser.profile.email)"
                loginUsingGoogle.setTitle("Sign Out", for: .normal)
                
            }
        }
    }
}

