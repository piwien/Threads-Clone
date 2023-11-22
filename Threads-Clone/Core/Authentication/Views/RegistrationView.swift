//
//  RegistrationView.swift
//  Threads-Clone
//
//  Created by Berkay Yaşar on 16.11.2023.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Spacer()
            Image("threads-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding(25)
            
            VStack {
                TextField("Enter your email", text: $viewModel.email)
                    .modifier(TextFieldModifier())
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                
                SecureField("Enter your password", text: $viewModel.password)
                    .modifier(TextFieldModifier())
                
                TextField("Enter your full name", text: $viewModel.fullname)
                    .modifier(TextFieldModifier())
                    .autocorrectionDisabled()
                
                TextField("Enter your username", text: $viewModel.username)
                    .modifier(TextFieldModifier())
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
            }
            
            Button {
                Task {
                    try await viewModel.createUser()
                }
            } label: {
                Text("Sign up")
                    .modifier(ButtonModifier())
            }
            .padding(.vertical)
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                    
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .foregroundStyle(.black)
            }
            .padding(.vertical, 16)
        }
    }
}

#Preview {
    RegistrationView()
}
