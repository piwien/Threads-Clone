//
//  ProfileViewModel.swift
//  Threads-Clone
//
//  Created by Berkay Yaşar on 22.11.2023.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            print("DEBUG: User in viewmodel from combine: \(user)")
        }.store(in: &cancellables)
    }
}
