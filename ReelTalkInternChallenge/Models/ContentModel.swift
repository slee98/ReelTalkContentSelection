//
//  ContentModel.swift
//  ReelTalkInternChallenge
//
//  Created by Soyeon Lee on 12/1/23.
//

import Foundation

struct ContentModel: Hashable, Decodable {
    
    let id: String
    let titleText: TitleText
    let primaryImage: ImageData?
    let releaseYear: Year
    
    struct TitleText: Hashable, Decodable {
        let text: String
    }
    
    struct ImageData: Hashable, Decodable {
        let id: String
        let width: Int
        let height: Int
        let url: String?
    }
    
    struct Year: Hashable, Decodable {
        let year: Int
    }
}

extension ContentModel {
    static let defaultMovie1 = ContentModel(id: "test1", titleText: TitleText(text: "Les haleurs de bateaux"), primaryImage: ImageData(id: "rm211543552", width: 226, height: 300, url: "https://m.media-amazon.com/images/M/MV5BM2ZlYjA4NmItZTYxYy00MGFiLTg3MWUtNzZmYjE1ODZmMThjXkEyXkFqcGdeQXVyNTI2NTY2MDI@._V1_.jpg"), releaseYear: Year(year: 1913))
    static let defaultMovie2 = ContentModel(id: "test2", titleText: TitleText(text: "Les haleurs de bateaux"), primaryImage: ImageData(id: "rm211543552", width: 226, height: 300, url: "https://m.media-amazon.com/images/M/MV5BM2ZlYjA4NmItZTYxYy00MGFiLTg3MWUtNzZmYjE1ODZmMThjXkEyXkFqcGdeQXVyNTI2NTY2MDI@._V1_.jpg"), releaseYear: Year(year: 1913))
}
