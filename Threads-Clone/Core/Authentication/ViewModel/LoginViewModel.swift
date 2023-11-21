//
//  LoginViewModel.swift
//  Threads-Clone
//
//  Created by Berkay Yaşar on 21.11.2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func loginUser() async throws {
        try await AuthService.shared.login(
            email: email,
            password: password
        )
    }
}
