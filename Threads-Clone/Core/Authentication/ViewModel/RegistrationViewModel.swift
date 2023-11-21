//
//  RegistrationViewModel.swift
//  Threads-Clone
//
//  Created by Berkay Yaşar on 20.11.2023.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    @Published var username = ""
    
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(
            email: email,
            password: password,
            fullname: fullname,
            username: username
        )
    }
}
