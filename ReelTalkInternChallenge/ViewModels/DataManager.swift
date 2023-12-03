//
//  DataManager.swift
//  ReelTalkInternChallenge
//
//  Created by Soyeon Lee on 11/30/23.
//

import Foundation

class DataManager {
    
    func getGenreList(completion: @escaping (_ genres: GenreResponse?, _ error: Error?) -> Void) {
        
        let headers = [
            "X-RapidAPI-Key": "2877f6f3c1msh583d7afd4450a5ap115794jsnc652b9ecd6e7",
            "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: URL(string: "https://moviesdatabase.p.rapidapi.com/titles/utils/genres")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                completion(nil, error)
            } else {
                DispatchQueue.main.async {
                    do {
                        let decodedList = try JSONDecoder().decode(GenreResponse.self, from: data!)
                        completion(decodedList, nil)
                    } catch let error {
                        completion(nil, error)
                    }
                }
            }
        })
        
        dataTask.resume()
    }
    
    func getMoviesList(genre: String, completion: @escaping (_ movies: ContentsResponse?, _ error: Error?) -> Void) {
        
        let headers = [
            "X-RapidAPI-Key": "2877f6f3c1msh583d7afd4450a5ap115794jsnc652b9ecd6e7",
            "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://moviesdatabase.p.rapidapi.com/titles?genre=\(genre)&titleType=movie")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                completion(nil, error)
            } else {
                DispatchQueue.main.async {
                    do {
                        let decodedList = try JSONDecoder().decode(ContentsResponse.self, from: data!)
                        completion(decodedList, nil)
                    } catch let error {
                        completion(nil, error)
                    }
                }
            }
        })
        
        dataTask.resume()
    }
    
    func getTVShowsList(genre: String, completion: @escaping (_ tvShows: ContentsResponse?, _ error: Error?) -> Void) {
        
        let headers = [
            "X-RapidAPI-Key": "2877f6f3c1msh583d7afd4450a5ap115794jsnc652b9ecd6e7",
            "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
        ]
        
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://moviesdatabase.p.rapidapi.com/titles?genre=\(genre)&titleType=tvEpisode")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                completion(nil, error)
            } else {
                DispatchQueue.main.async {
                    do {
                        let decodedList = try JSONDecoder().decode(ContentsResponse.self, from: data!)
                        completion(decodedList, nil)
                    } catch let error {
                        completion(nil, error)
                    }
                }
            }
        })
        
        dataTask.resume()
    }
    
}
