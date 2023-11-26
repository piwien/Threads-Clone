//
//  ThreadCellView.swift
//  Threads-Clone
//
//  Created by Berkay Yaşar on 16.11.2023.
//

import SwiftUI

struct ThreadCellView: View {
    let thread: Thread
    @State private var likeicon = "heart"
    @StateObject var viewModel = FeedViewModel()
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                CircularUserProfileView(user: thread.user, size: .small)
//                    .overlay(
//                        Circle()
//                            .stroke(Color.black, lineWidth: 1)
//                    )
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(thread.user?.username ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text(thread.timestamp.timestampString())
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        
                        Button(action: {}, label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(.black)
                        })
                    }
                    // caption example: "Thrilled to announce my return to @ScuderiaFerrari! 🤩🔴 Grateful for the opportunity to wear the prancing horse again and join the passionate tifosi. Let's create more unforgettable moments together! Grazie mille for the warm welcome back. 🙏🏎️ #ForzaFerrari #SebReturns"
                    Text(thread.caption)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    
                    HStack(spacing: 16) {
                        Button {
                            Task {
                                do {
                                    if likeicon == "heart" {
                                        likeicon = "heart.fill"
                                        viewModel.likeupdate+=1
                                        print("Kalpli: \(viewModel.likeupdate)")
                                        try await viewModel.plusLike(thread: thread)
                                    } else {
                                        likeicon = "heart"
                                        viewModel.likeupdate-=1
                                        print("Kalpsiz: \(viewModel.likeupdate)")
                                        try await viewModel.minusLike(thread: thread)
                                    }
                                } catch {
                                    print("Error: \(error.localizedDescription)")
                                }
                            }
                        } label: {
                            Image(systemName: likeicon)
                                .foregroundStyle(likeicon == "heart" ? .black : .pink)
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
                    
//                    if thread.likes + likeupdate > 1 {
//                        Text("\(thread.likes + likeupdate) likes")
//                            .font(.footnote)
//                            .foregroundStyle(.gray)
//                    } else if thread.likes + likeupdate == 1 {
//                        Text("\(thread.likes + likeupdate) like")
//                            .font(.footnote)
//                            .foregroundStyle(.gray)
//                    }
                    
                    if thread.likes + viewModel.likeupdate > 1 {
                                Text("\(thread.likes + viewModel.likeupdate) likes")
                                    .font(.footnote)
                                    .foregroundStyle(.gray)
                            } else if thread.likes + viewModel.likeupdate == 1 {
                                Text("\(thread.likes + viewModel.likeupdate) like")
                                    .font(.footnote)
                                    .foregroundStyle(.gray)
                            }

                    
                }
            }
            Divider()
        }
        .onChange(of: thread.likes) {
            viewModel.likeupdate = 0
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}


#Preview {
    ThreadCellView(thread: DeveloperPreview.shared.thread)
}
