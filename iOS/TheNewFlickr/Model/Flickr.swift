//
//  Flickr.swift
//  TheNewFlickr
//
//  Created by Mahmoud Aziz on 16/08/2021.
//

import Foundation

struct Flickr: Decodable {
    let photos: Photos
}

struct Photos: Decodable {
    let photo: [Photo]
}

struct Photo: Decodable {
    let id: String
    let owner: String
    let secret: String
    let server: String
    let farm: Int
    let title: String
    let ispublic: Int
    let isfriend: Int
    let isfamily: Int
    let ownername: String
    let datetaken: String
}


