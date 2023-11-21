//
//  AuthService.swift
//  Threads-Clone
//
//  Created by Berkay Yaşar on 20.11.2023.
//

import Firebase

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            print("Logged in user: \(result.user.uid)")
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(email: String, password: String, fullname: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            print("User: \(result.user.uid)")
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut() // signout backend
        self.userSession = nil // signout locally
    }
}
