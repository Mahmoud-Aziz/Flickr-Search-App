//
//  ViewController.swift
//  TheNewFlickr
//
//  Created by Abdoelrhman Eaita on 13/07/2021.
//

import UIKit

struct APIInfo {
    static let key = "94b0a1ad9d4f1aebf9f2f2c006fb4c65"
    static let secret = "c21744829fca03e7"
    static let url = "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(key)&text=cat&format=json&nojsoncallback=1"
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

