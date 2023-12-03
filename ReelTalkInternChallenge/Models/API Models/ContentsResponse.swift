//
//  ContentsResponse.swift
//  ReelTalkInternChallenge
//
//  Created by Soyeon Lee on 12/1/23.
//

import Foundation

struct ContentsResponse: Decodable {
    let page: Int
    let next: String?
    let entries: Int
    let results: [ContentModel]
}
