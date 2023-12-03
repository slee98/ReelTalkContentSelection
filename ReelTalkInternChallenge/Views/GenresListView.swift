//
//  GenresListView.swift
//  ReelTalkInternChallenge
//
//  Created by Soyeon Lee on 11/30/23.
//

import SwiftUI

struct GenresListView: View {
    
    
    @ObservedObject var viewModel : OnboardingViewModel
    
    private var columns: [GridItem] = [
        GridItem(.fixed(160)),
        GridItem(.fixed(160))
    ]
    
    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: columns, alignment: .leading, spacing: 10) {
                if let genresList = viewModel.genresList {
                    ForEach(genresList, id: \.self) { genre in
                        
                        Button(action: {
                            viewModel.selectGenre(genre: genre)
                        }) {
                            Text(genre)
                                .font(FontStyle.boldBody.font)
                                .fontWeight(FontStyle.boldBody.weight)
                                .kerning(FontStyle.boldBody.letterSpacing)
                                .padding(.horizontal, 24)
                                .padding(.vertical, 5)
                                .background(
                                    RoundedRectangle(cornerRadius: 30)
                                        .fill(viewModel.selectedGenres.contains(genre) ? .white : .clear)
                                        .stroke(Color.white, lineWidth: 1)
                                )
                                .foregroundColor(viewModel.selectedGenres.contains(genre) ? .black : .white)
                        }
                    }
                    .padding(.top, 1)
                } else {
                    Text("Loading genres...")
                        .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    GenresListView(viewModel: OnboardingViewModel())
        .background(.blue)
}
