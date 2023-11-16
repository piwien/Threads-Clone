//
//  RegistrationView.swift
//  Threads-Clone
//
//  Created by Berkay Yaşar on 16.11.2023.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var username = ""
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
                TextField("Enter your email", text: $email)
                    .modifier(TextFieldModifier())
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                
                SecureField("Enter your password", text: $password)
                    .modifier(TextFieldModifier())
                
                TextField("Enter your full name", text: $fullname)
                    .modifier(TextFieldModifier())
                
                TextField("Enter your username", text: $username)
                    .modifier(TextFieldModifier())
            }
            
            Button {
                dismiss()
            } label: {
                Text("Sign up")
                    .modifier(ButtonModifier())
            }
            .padding(.vertical)
            
            Spacer()
            
            Button {
                
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
