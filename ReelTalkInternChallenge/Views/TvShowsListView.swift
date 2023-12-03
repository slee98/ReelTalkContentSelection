//
//  TvShowsListView.swift
//  ReelTalkInternChallenge
//
//  Created by Soyeon Lee on 12/1/23.
//

import SwiftUI

struct TvShowsListView: View {
    
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
                    if let tvShowsList = viewModel.tvShowsList {
                        ForEach(tvShowsList, id: \.self) { tvshow in
                            ContentCardView(content: tvshow, isSelected: viewModel.selectedTvShows.contains(tvshow)) {
                                viewModel.selectTvshow(tvShow: tvshow)
                            }
                        }
                    }
                    else {
                        Text("Loading tvshows...")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}



#Preview {
    let vm = OnboardingViewModel()
    vm.fetchTVShowList()
    return TvShowsListView(viewModel: vm)
}
