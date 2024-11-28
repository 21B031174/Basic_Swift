//
//  StructProtocol.swift
//  MyFavApp
//
//  Created by Елшан Арсен on 15.11.2024.
//

import UIKit

protocol StructProtocol {
    var title: String { get }
    var description: String { get }
    var coverImage: UIImage { get }
}

struct BooksStruct: StructProtocol {
    let title: String
    let author: String
    let genre: String
    let coverImage: UIImage
    let description: String
}

struct FilmsStruct: StructProtocol {
    let title: String
    let year: String
    let genre: String
    let coverImage: UIImage
    let description: String
}

struct MusicsStruct: StructProtocol {
    let title: String
    let artist: String
    let coverImage: UIImage
    let description: String
}
