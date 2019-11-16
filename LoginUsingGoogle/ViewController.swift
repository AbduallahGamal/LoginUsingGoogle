//
//  ViewController.swift
//  LoginUsingGoogle
//
//  Created by Abdalla on 10/17/19.
//  Copyright © 2019 edu.data. All rights reserved.
//

import UIKit
import GoogleSignIn
import CTHelp

class ViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {

    @IBOutlet weak var CTHHelp: UIButton!
    @IBOutlet weak var loginUsingGoogle: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginUsingGoogle.addTarget(self, action: #selector(loginGoogle(_:)), for: .touchUpInside)
        Utilities.styleFilledButton(loginUsingGoogle)
        Utilities.styleHollowButton(loginUsingGoogle)
        Utilities.styleFilledButton(CTHHelp)
        Utilities.styleHollowButton(CTHHelp)

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
        { print("We have an error ==\(error.localizedDescription)") }
        else { if let gmailUser = user
        { lblTitle.text = "You are sign in using id \(String(describing: gmailUser.profile.email))"
                loginUsingGoogle.setTitle("Sign Out", for: .normal) }
        }
    }
    
    @IBAction func doCTHelpFunction(_ sender: Any) {
       showCTHelp()
    }
    
    func showCTHelp() {
        
        let ctHelp = CTHelp()
        
         //Optional values to set colors
         ctHelp.ctBgViewColor = .white
         ctHelp.ctTitleColor = .darkText
         ctHelp.ctHelpTextColor = .darkGray
         ctHelp.ctActionButtonBGColor = UIColor(red: 28/255, green: 136/255, blue: 197.255, alpha: 1)
         ctHelp.ctActionButtonTextColor = .white
        
        ctHelp.new(CTHelpItem(title:"No Text-Image Only",
                              helpText: "",
                              imageName:"icons8-search-512"))
        ctHelp.new(CTHelpItem(title:"Text and Image",
                              helpText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                              imageName:"iconfinder_phone_1055012"))
        ctHelp.new(CTHelpItem(title:"No Image-Text Only",
                              helpText: "Eu tempor suscipit dis sed. Tortor velit orci bibendum mattis non metus ornare consequat. Condimentum habitasse dictumst eros nibh rhoncus non pulvinar fermentum. Maecenas convallis gravida facilisis. Interdum, conubia lacinia magnis duis nec quisque.Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                              imageName:""))
        
         //Optional addition of two default cards
         //Use only if you wish to change the strings presented in the two default cards
         ctHelp.ctWebButtonTitle = "Go to Google"
         //ctHelp.ctWebHelpText = ""
         //ctHelp.ctContactTitle = ""
         //ctHelp.ctContactHelpText = ""
         //ctHelp.ctIncludeDataText = ""
         //ctHelp.ctContactButtonTitle = ""
        
         //Email data
         //ctHelp.ctEmailSubject = "Hello Project"
         //ctHelp.ctEmailAttachNote = ""
         //ctHelp.ctEmailBody = "I Want to Meet You, "
        
         //Email alert
         //ctHelp.ctDataAlertTitle = ""
         //ctHelp.ctDataAlertMessage = ""
         //ctHelp.ctDataAlertActionNo = ""
         //ctHelp.ctDataAlertActionYes = ""
        
        ctHelp.appendDefaults(companyName: "FCI", emailAddress: "abduallahgamal@gmail.com", data: nil, webSite: "https://www.google.com", companyImageName: "iconfinder_Apple__logo_company_4096583")
        
        ctHelp.presentHelp(from: self)
    }
}

