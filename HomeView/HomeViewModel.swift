//
//  HomeViewModel.swift
//  NMVVM
//
//  Created by Naresh on 12/4/23.
//

import Foundation
final class HomeViewModel {
    
   @Published var welcomeMessage: String?
    
    func getLoggedInUser() {
        let user = NetworkService.shared.getLoggedInUser()
        self.welcomeMessage = "Hello, \(user.firstName) \(user.lastName)"
    }
    
}
