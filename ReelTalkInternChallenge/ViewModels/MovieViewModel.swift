//
//  MovieViewModel.swift
//  ReelTalkInternChallenge
//
//  Created by Soyeon Lee on 11/30/23.
//

import Foundation

class MovieViewModel: ObservableObject {
    
    @Published var MovieList: ContentsResponse?
    
    init() {
        getMovieList()
    }
    
    func getMovieList() {
        
        let headers = [
            "X-RapidAPI-Key": "2877f6f3c1msh583d7afd4450a5ap115794jsnc652b9ecd6e7",
            "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://moviesdatabase.p.rapidapi.com/titles")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                let httpResponse = response as? HTTPURLResponse
                DispatchQueue.main.async {
                    do {
                        let decodedList = try JSONDecoder().decode(ContentsResponse.self, from: data!)
                        self.MovieList = decodedList
                        print(self.MovieList?.results )
                    } catch let error {
                            print("Error decoding: ", error)
                    }
                }
            }
        })
        
        dataTask.resume()
    }
}

