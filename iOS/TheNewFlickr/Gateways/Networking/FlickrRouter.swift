//
//  FlickrRouter.swift
//  TheNewFlickr
//
//  Created by Mahmoud Aziz on 16/08/2021.
//

import Foundation
import Alamofire

enum FlickrRouter: URLRequestConvertible {
    
    static let baseUrl = "https://api.flickr.com/services/rest/"
    static var searchQuery: String?
    
    case searchImages
    
    var httpMethod: HTTPMethod {
        switch self {
        case .searchImages:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .searchImages:
            return [
                "method": "flickr.photos.search",
                "api_key": "94b0a1ad9d4f1aebf9f2f2c006fb4c65",

                "sort": "relevance",
                "per_page": "30",
                "format": "json",
                "nojsoncallback": "1",
                "extras": "owner_name,date_taken",
                "text": "\(FlickrRouter.searchQuery ?? "movies")"
                ]
        }
    }
    
    var headers: [String: String] {
        switch self {
        case .searchImages:
            return [:]
        }
    }

    var encoding: ParameterEncoding {
        switch self {
        case .searchImages:
            return URLEncoding.default
        }
    }

    func asURLRequest() throws -> URLRequest {
        let urlString = FlickrRouter.baseUrl
        let url = URL(string: urlString)!

        var request = URLRequest(url: url)
        request.method = self.httpMethod
        request.headers = HTTPHeaders(headers)

        return try! encoding.encode(request, with: parameters)
    }
}
