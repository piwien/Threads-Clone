//
//  ActivityView.swift
//  Threads-Clone
//
//  Created by Berkay Yaşar on 16.11.2023.
//

import SwiftUI

struct ButtonItem: Identifiable {
    var id = UUID()
    var text: String
    var toggle: Bool
}

struct ActivityView: View {
    
    @State private var buttonname = [
        ButtonItem(text: "All", toggle: true),
        ButtonItem(text: "Requests", toggle: false),
        ButtonItem(text: "Replies", toggle: false),
        ButtonItem(text: "Mentions", toggle: false),
        ButtonItem(text: "Quotes", toggle: false),
        ButtonItem(text: "Reposts", toggle: false)
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Activity")
                .font(.largeTitle)
                .foregroundColor(.black)
                .fontWeight(.bold)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(buttonname) { item in
                        Button(action: {
                            // Tıklanan butonun durumu sadece true yapılır, diğerleri false yapılır
                            buttonname.indices.forEach { i in
                                buttonname[i].toggle = (buttonname[i].id == item.id)
                            }
                        }, label: {
                            Text(item.text)
                                .frame(width: 80, height: 20)
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundColor(item.toggle ? .white : .black)
                                .padding(5)
                                .background(item.toggle ? .black : .white)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 5).stroke(Color(.gray),lineWidth: 0.5)
                                }
                        })
                    }
                }
            }
            Spacer()
            
            HStack {
                Spacer()
                Text("No activity")
                    .foregroundStyle(.black)
                    .fontWeight(.semibold)
                Spacer()
            }
            
            
            Spacer()
        }
        .padding(.horizontal)
    }
}


struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
