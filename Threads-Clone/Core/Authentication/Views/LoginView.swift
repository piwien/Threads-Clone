//
//  LoginView.swift
//  Threads-Clone
//
//  Created by Berkay Yaşar on 16.11.2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image("threads-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding(25)
                
                VStack {
                    TextField("Enter your email", text: $viewModel.email)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .modifier(TextFieldModifier())
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    
                    SecureField("Enter your password", text: $viewModel.password)
                        .modifier(TextFieldModifier())
                }
                
                NavigationLink {
                    Text("Forgot password")
                } label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.vertical)
                        .padding(.trailing, 28)
                }
                
                Button {
                    Task { try await viewModel.loginUser() }
                } label: {
                    Text("Login")
                        .modifier(ButtonModifier())
                }
                
                Spacer()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack {
                        Text("Don't have an account?")
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    .foregroundStyle(.black)
                }
                .padding(.vertical, 16)
            }
        }
    }
}

#Preview {
    LoginView()
}
