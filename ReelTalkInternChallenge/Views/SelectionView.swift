//
//  SelectionView.swift
//  ReelTalkInternChallenge
//
//  Created by Soyeon Lee on 11/30/23.
//

import SwiftUI

struct SelectionView: View {
    
    @ObservedObject var viewModel: OnboardingViewModel
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            
            TabView(selection: $viewModel.selectedTab) {
                
                VStack {
                    CustomCarouselView(currentTabIndex: viewModel.selectedTab.rawValue)
                        .padding(.top, 24)
                    GenresHeadlineTextView(title: "Select your top 3 genres for movies and TV", caption: "\(viewModel.selectedGenres.count)/\(viewModel.maxGenresSelectionCount)selected")
                        .padding(.top, 30)
                    GenresListView(viewModel: viewModel)
                        .frame(width: 344, height: 364)
                        .padding(.top, 30)
                    
                    ContinueButtonView(action: { viewModel.continueWithGenreSelection()})
                        .foregroundColor(viewModel.canContinueToMovie ? .red : .blue)
                        .disabled(!viewModel.canContinueToMovie)
                        .padding(.top, 80)
                    Spacer()
                }
                .tag(OnboardingViewModel.Tab.genresSelection)
                
                VStack {
                    CustomCarouselView(currentTabIndex: viewModel.selectedTab.rawValue)
                        .padding(.top, 24)
                    GenresHeadlineTextView(title: "Select your top 5 \n movies", caption: "\(viewModel.selectedMovies.count)/\(viewModel.maxMoviesSelectionCount)selected")
                        .padding(.top, 30)
                    
                    MoviesListView(viewModel: viewModel)
                        .frame(width: 334, height: 460)
                    
                    ContinueButtonView(action: { viewModel.continueWithMovieSelection()})
                        .foregroundColor(viewModel.canContinueToTVShow ? .red : .blue)
                        .disabled(!viewModel.canContinueToTVShow)
                        .padding(.top, 15)
                    Spacer()
                }
                .tag(OnboardingViewModel.Tab.moviesSelection)
                
                VStack {
                    CustomCarouselView(currentTabIndex: viewModel.selectedTab.rawValue)
                        .padding(.top, 24)
                    GenresHeadlineTextView(title: "Select your top 5 \n tvshows", caption: "\(viewModel.selectedTvShows.count)/\(viewModel.maxTVShowsSelectionCount)selected")
                        .padding(.top, 30)
                    TvShowsListView(viewModel: viewModel)
                        .frame(width: 334, height: 460)
                    
                    ContinueButtonView(action: { viewModel.continueWithTvShowSelection()})
                        .foregroundColor(viewModel.canContinueToTVShow ? .red : .blue)
                        .disabled(!viewModel.canContinueToTVShow)
                        .padding(.top, 15)
                    Spacer()
                }
                .tag(OnboardingViewModel.Tab.tvShowsSelection)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}

struct GenresHeadlineTextView: View {
    let title: String
    let caption: String
    
    var body: some View {
        VStack {
            Text(title)
                .frame(width: 312, height: 70, alignment: .center)
                .font(FontStyle.titleH3.font)
                .fontWeight(FontStyle.titleH3.weight)
                .kerning(FontStyle.titleH3.letterSpacing)
                .multilineTextAlignment(.center)
                .foregroundColor(.highEmphasis)
            
            Text(caption)
                .font(FontStyle.subtitle.font)
                .fontWeight(FontStyle.subtitle.weight)
                .foregroundColor(.highEmphasis)
        }
    }
}


#Preview {
    SelectionView(viewModel: OnboardingViewModel())
}
