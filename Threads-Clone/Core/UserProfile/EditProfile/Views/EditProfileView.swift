//
//  EditProfileView.swift
//  Threads-Clone
//
//  Created by Berkay Yaşar on 20.11.2023.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivate = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea(edges: [.bottom, .horizontal])
                
                VStack {
                    
                    // Namefield
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.semibold)
                            
                            Text("Sebastian Vettel")
                        }
                        
                        Spacer()
                        
                        CircularUserProfileView()
                    }
                    
                    Divider()
                    
                    // Bio
                        VStack(alignment: .leading) {
                            Text("Bio")
                                .fontWeight(.semibold)
                            
                            TextField("Enter your bio...", text: $bio, axis: .vertical)
                        }
                    
                    Divider()
                    
                    // Link
                        VStack(alignment: .leading) {
                            Text("Link")
                                .fontWeight(.semibold)
                            
                            TextField("Add link", text: $link, axis: .vertical)
                        }
                    
                    Divider()
                    
                    // Private/Public Profile
                    Toggle("Private profile", isOn: $isPrivate)
                    
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay {
                    RoundedRectangle(cornerRadius: 10).stroke(Color(.systemGray4), lineWidth: 1)
                }
                .padding()
                
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    EditProfileView()
}
