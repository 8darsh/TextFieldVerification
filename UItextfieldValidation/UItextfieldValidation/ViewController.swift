//
//  ViewController.swift
//  UItextfieldValidation
//
//  Created by Adarsh Singh on 01/08/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtEmail: UITextField!
    
    @IBOutlet var txtPass: UITextField!
    
    @IBOutlet var txtPhone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickSave(_ sender: UIButton) {
        
        if(txtEmail.text?.isValidEmail)!{
            print("email is valid")
        }
        else{
            print("email is not valid")
        }
        
        if(txtPass.text?.isPasswordValid)!{
            print("password is valid")
        }
        else{
            print("pass is not valid")
        }
        
        if(txtPhone.text?.isPhoneNumber)!{
            print("phone is valid")
        }else{
            print("phone is not valid")
        }
    }
    
}
extension String {
    var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector (types:
                                                NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0,self.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 &&
                res.range.length == self.count && self.count == 10
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    var isPasswordValid: Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\dS@S#!%*?&]{8,}")
        return passwordTest.evaluate(with: self)
    }
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        let emailTest = NSPredicate (format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}

