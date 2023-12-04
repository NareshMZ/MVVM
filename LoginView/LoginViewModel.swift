//
//  LoginViewModel.swift
//  NMVVM
//
//  Created by Naresh on 12/4/23.
//

import Foundation

final class LoginViewModel {
    
@Published  var error: String?
func login(email: String, password: String) {
    NetworkService.shared.login(email: email, password: password) { [weak self] success in
        self?.error = success ? nil : "Invalid Credentials!!!"
    }
}
}
