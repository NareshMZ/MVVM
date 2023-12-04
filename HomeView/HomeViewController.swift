//
//  HomeViewController.swift
//  NMVVM
//
//  Created by Naresh on 12/4/23.
//

import Foundation
import UIKit
import Combine

class HomeViewController: UIViewController {
    @IBOutlet weak var welcomeLbl: UILabel!
    
    private let viewModel = HomeViewModel()
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinders()
        viewModel.getLoggedInUser()
    }
    
    private func setupBinders() {
        viewModel.$welcomeMessage.sink { [weak self] message in
            self?.welcomeLbl.text = message
        }.store(in: &cancellables)
    }
    
}
