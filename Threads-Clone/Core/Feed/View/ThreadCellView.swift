//
//  ThreadCellView.swift
//  Threads-Clone
//
//  Created by Berkay Yaşar on 16.11.2023.
//

import SwiftUI

struct ThreadCellView: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                CircularUserProfileView(user: nil, size: .small)
//                    .overlay(
//                        Circle()
//                            .stroke(Color.black, lineWidth: 1)
//                    )
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("sebastianvettel")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("10m")
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        
                        Button(action: {}, label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(.black)
                        })
                    }
                    
                    Text("Thrilled to announce my return to @ScuderiaFerrari! 🤩🔴 Grateful for the opportunity to wear the prancing horse again and join the passionate tifosi. Let's create more unforgettable moments together! Grazie mille for the warm welcome back. 🙏🏎️ #ForzaFerrari #SebReturns")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    
                    HStack(spacing: 16) {
                        Button {
                            
                        } label: {
                            Image(systemName: "heart")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "bubble.right")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "paperplane")
                        }
                    }
                    .padding(.vertical,8)
                    .foregroundStyle(.black)
                }
            }
            Divider()
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}

#Preview {
    ThreadCellView()
}
