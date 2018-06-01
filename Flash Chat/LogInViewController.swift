//
//  LogInViewController.swift
//  Flash Chat
//
//  This is the view controller where users login


import UIKit
import Firebase
import SVProgressHUD

class LogInViewController: UIViewController {

    //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   func showAlert(title: String, message: String){
      
      let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
      alertView.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
      self.present(alertView, animated: true, completion: nil)
   }
   
    @IBAction func logInPressed(_ sender: AnyObject) {

        //TODO: Log in the user
      Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
         
         if error != nil {
            self.showAlert(title: "Error", message: error!.localizedDescription)
         } else {
            SVProgressHUD.show()
            print("login in successful")
            SVProgressHUD.dismiss()
            self.performSegue(withIdentifier: "goToChat", sender: self)
         }
      }
   
    }
    
}  
