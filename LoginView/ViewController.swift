//
//  ViewController.swift
//  NMVVM
//
//  Created by Naresh on 12/4/23.
//

import UIKit
import UIKit
import Combine


class ViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    private let viewModel = LoginViewModel()
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinders()
    }
    
    private func setupBinders() {
        viewModel.$error.sink { [weak self] error in
            if let error = error {
                print(error)
                } else {
                self?.goToHomePage()
            }
        }.store(in: &cancellables)
    }
    
    private func goToHomePage() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func loginBtnClicked(_ sender: UIButton) {
        guard let email = emailField.text,
              let password = passwordField.text else {
                  print("Please enter email and password")
                  return
              }
        viewModel.login(email: email, password: password)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

