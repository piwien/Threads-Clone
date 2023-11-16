//
//  ExploreView.swift
//  Threads-Clone
//
//  Created by Berkay Yaşar on 16.11.2023.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchtext = ""
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(0 ... 10, id: \.self) { user in
                        VStack {
                            UserCellView()
                            
                            Divider()
                        }
                        .padding(.vertical, 3)
                    }
                }
            }
            .navigationTitle("Search")
            .searchable(text: $searchtext, prompt: "Search")
        }
    }
}

#Preview {
    ExploreView()
}
