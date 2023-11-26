//
//  ExploreView.swift
//  Threads-Clone
//
//  Created by Berkay Yaşar on 16.11.2023.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchtext = ""
    @StateObject var viewModel = ExploreViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            VStack {
                                UserCellView(user: user)
                                Divider()
                            }
                            .padding(.vertical, 3)
                        }
                    }
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                UserProfileView(user: user)
            })
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.automatic)
        }

        .searchable(text: $searchtext, prompt: "Search")
    }
}

#Preview {
    ExploreView()
}
