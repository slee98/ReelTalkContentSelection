//
//  OnboardingViewModel.swift
//  ReelTalkInternChallenge
//
//  Created by Soyeon Lee on 12/1/23.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    
    enum Tab: Int {
        case genresSelection
        case moviesSelection
        case tvShowsSelection
        
    }
    
    private let dataManager = DataManager()
    
    @Published var selectedTab: Tab = .genresSelection
    @Published var searchText: String = ""
    
    @Published var genresList: [String]? = nil
    @Published private(set) var selectedGenres: Set<String> = []
    let maxGenresSelectionCount:  Int = 3
    var canContinueToMovie: Bool {
        return !selectedGenres.isEmpty
    }
    
    @Published var moviesList: [ContentModel]? = nil
    //to do private(set)
    @Published var selectedMovies: Set<ContentModel> = []
    let maxMoviesSelectionCount:  Int = 5
    var canContinueToTVShow: Bool {
        return !selectedMovies.isEmpty
    }
    
    @Published var tvShowsList: [ContentModel]? = nil
    @Published private(set) var selectedTvShows: Set<ContentModel> = []
    let maxTVShowsSelectionCount:  Int = 5
    
    
    init() {
        fetchGenreList()
    }
    
    func fetchGenreList() {
        genresList = nil
        dataManager.getGenreList { [weak self] resultGenreModel, error in
            if let genresList = resultGenreModel?.results {
                self?.genresList = genresList.compactMap { $0 }
            } else {
                self?.genresList = nil
            }
        }
    }
    
    func selectGenre(genre: String) {
        
        if selectedGenres.contains(genre) {
            selectedGenres.remove(genre)
        }
        else if selectedGenres.count < maxGenresSelectionCount {
            selectedGenres.insert(genre)
        }
    }
    
    func continueWithGenreSelection() {
        guard canContinueToMovie else {
            return
        }
        fetchMoveList()
        selectedTab = .moviesSelection
    }
    
    func continueWithMovieSelection() {
        guard canContinueToTVShow else {
            return
        }
        fetchTVShowList()
        selectedTab = .tvShowsSelection
    }
    
    func continueWithTvShowSelection() {
       
    }
    
    func fetchMoveList() {
        moviesList = nil
        dataManager.getMoviesList(genre: selectedGenres.first ?? "Comedy") { [weak self] resultMovieModel, error in
            if let moviesList = resultMovieModel?.results {
                self?.moviesList = moviesList.compactMap { $0 }
            } else {
                self?.moviesList = nil
            }
        }
    }
    
    func selectMovie(movie: ContentModel) {
        if selectedMovies.contains(movie) {
            selectedMovies.remove(movie)
        }
        else if selectedMovies.count < maxMoviesSelectionCount {
            selectedMovies.insert(movie)
        }
    }
    
    func fetchTVShowList() {
        tvShowsList = nil
        dataManager.getTVShowsList(genre: selectedGenres.first ?? "Comedy") { [weak self] resultTvShowModel, error in
            if let tvShowsList = resultTvShowModel?.results {
                self?.tvShowsList = tvShowsList.compactMap { $0 }
            } else {
                self?.tvShowsList = nil
            }
        }
    }
    
    func selectTvshow(tvShow: ContentModel) {
        if selectedTvShows.contains(tvShow) {
            selectedTvShows.remove(tvShow)
        }
        else if selectedTvShows.count < maxTVShowsSelectionCount {
            selectedTvShows.insert(tvShow)
        }
    }
}
