//
//  AuthService.swift
//  Threads-Clone
//
//  Created by Berkay Yaşar on 20.11.2023.
//

import Firebase

class AuthService {
    
    static let shared = AuthService()
    
    @MainActor
    func login(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: email)
            print("User: \(result.user.uid)")
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(email: String, password: String, fullname: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("User: \(result.user.uid)")
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}
