//
//  FlickrRequest.swift
//  TheNewFlickr
//
//  Created by Mahmoud Aziz on 16/08/2021.
//

import Foundation
import Alamofire

class FlickrRequest {
    
    func retrieveAllPhotos(
        _ completionHandler: @escaping (Result<Flickr, AFError>) -> Void
    ) {
        let route = FlickrRouter.searchImages
        AF.request(route).responseDecodable { (response: DataResponse<Flickr, AFError>) in
            
            switch response.result {
            case .success(let photos):
                completionHandler(.success(photos))
            case .failure(let error):
                completionHandler(.failure(error))
            }
            
        }
    }
}
