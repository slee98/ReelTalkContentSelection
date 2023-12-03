//
//  MoviesListView.swift
//  ReelTalkInternChallenge
//
//  Created by Soyeon Lee on 12/1/23.
//

import SwiftUI

struct MoviesListView: View {
    
    @ObservedObject var viewModel : OnboardingViewModel
    
    private var columns: [GridItem] = [
        GridItem(.fixed(175)),
        GridItem(.fixed(175))
    ]
    
    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                SearchBarView(searchText: $viewModel.searchText)
                    .padding(.bottom, 24)
                
                LazyVGrid(columns: columns, alignment: .center) {
                    
                    if let moviesList = viewModel.moviesList {
                        ForEach(moviesList, id: \.self) { movie in
                            
                            ContentCardView(content: movie, isSelected: viewModel.selectedMovies.contains(movie)) {
                                viewModel.selectMovie(movie: movie)
                            }
                        }
                    }
                    else {
                        Text("Loading movies...")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct ContentCardView: View {
    
    let content: ContentModel
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            ZStack(alignment: .topTrailing) {
                
                VStack {
                    if let movieImageURL = content.primaryImage?.url {
                        AsyncImage(url: URL(string: movieImageURL)) { phase in
                            if phase.image != nil {
                                phase.image?.resizable()
                                    .frame(width: 155, height: 229)
                            } else {
                                ProgressView()
                                    .frame(width: 155, height: 229)
                            }
                        }
                        .border(isSelected ? Color("ButtonColor") : .clear, width: 3)
                    }
                    else {
                        Image(systemName: "photo")
                            .frame(width: 155, height: 229)
                            .border(isSelected ? Color("ButtonColor") : .clear, width: 3)
                    }
                    
                    Text(content.titleText.text + " (\(String(content.releaseYear.year)))")
                        .padding(.horizontal, 24)
                        .padding(.vertical, 5)
                        .font(FontStyle.smallText.font)
                        .fontWeight(FontStyle.smallText.weight)
                        .kerning(FontStyle.smallText.letterSpacing)
                        .foregroundColor(.highEmphasis)
                }
                
                if isSelected {
                    Image("CheckCircle")
                        .padding(.top, 8)
                        .padding(.trailing, 8)
                }
            }
        }
        .cornerRadius(4)
    }
}

#Preview {
    let vm = OnboardingViewModel()
    vm.moviesList = [
        ContentModel.defaultMovie1,
        ContentModel.defaultMovie2
    ]
    vm.selectedMovies = [ContentModel.defaultMovie1]
    return MoviesListView(viewModel: vm)
        .background(.black)
}
