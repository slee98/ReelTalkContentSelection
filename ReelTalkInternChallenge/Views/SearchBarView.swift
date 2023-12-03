//
//  SearchBarView.swift
//  ReelTalkInternChallenge
//
//  Created by Soyeon Lee on 12/1/23.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText : String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .padding()
            TextField("Search to add more", text: $searchText)
                .font(FontStyle.subtitle.font)
                .fontWeight(FontStyle.subtitle.weight)
                .kerning(FontStyle.subtitle.letterSpacing)
        }
        .foregroundColor(Color("Gray"))
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.white)
                .shadow(color: Color(.gray).opacity(0.5), radius: 5, x: 0, y: 0)
        )
        .frame(width: 326, height: 48)
    }
}

#Preview {
    @State var searchText: String = ""
    return SearchBarView(searchText: $searchText)
}
