//
//  LoginViewController.swift
//  DesignApp
//
//  Created by Ahmed Eltrass on 27/09/2022.
//

import UIKit
import Firebase 
import Combine
class LoginViewController: UIViewController {
    enum LoginStates {
    case SignUp
    case SignIn
    }

    @IBOutlet weak var loginCard: CustomBlurView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var praimaryBtn:  UIButton!
    @IBOutlet weak var scandaryBtn: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
  
    var  emailIsEmpty = true
    var passwordIsEmpty = true
    private var token : Set<AnyCancellable> = []
    var LoginState : LoginStates = .SignUp {
        didSet{
            self.titleLabel.text = (LoginState == .SignUp) ? "Sign Up" : "Sign In"
            self.praimaryBtn.setTitle((LoginState == .SignUp) ? "Create Account" : "Sign In", for:.normal)
            self.scandaryBtn.setTitle((LoginState == .SignUp) ? "Dont Have Any Account" : "Already Have  An Account", for: .normal)
            self.passwordTextField.textContentType = (LoginState == .SignUp) ? .newPassword : .password
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseInOut) {
            self.loginCard.alpha = 1
            
            self.loginCard.frame = self.loginCard.frame.offsetBy(dx: 0, dy: -400)
        }
        emailTextField.publisher(for: \.text)
            .sink { newValue in
                self.emailIsEmpty = (newValue == "" || newValue == nil)
            }
            .store(in: &token)
        passwordTextField.publisher(for: \.text)
            .sink { newValue in
                self.passwordIsEmpty = (newValue == "" || newValue == nil)
            }
            .store(in: &token)
    }

    
    
    
    @IBAction func primaryButtonAcotin(_ sender: Any) {
        if (emailIsEmpty || passwordIsEmpty){
            let alert = UIAlertController(title: "Missing Information", message: "Please make sure enter a valid email address and  a password ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }else{
            if LoginState == .SignUp {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!)
             { result,error in
                guard error == nil else {
                    print(error!.localizedDescription)
                    
                     return
                }
                 self.goHomeScreen()
            }
            }
            else{
                Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { authResult, error in
                    guard error == nil else {
                        print(error!.localizedDescription)
                        
                         return
                }
                    self.goHomeScreen()
            }
        }
       
    }
    
    }
    @IBAction func scondaryButtonAction(_ sender: Any) {
        self.LoginState = (self.LoginState == .SignUp) ? .SignIn : .SignUp
    }
    
    func goHomeScreen(){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "customControllerView") as! CutomTabBarViewController
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
