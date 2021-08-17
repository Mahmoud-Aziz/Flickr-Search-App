//
//  DetailsViewController.swift
//  TheNewFlickr
//
//  Created by Mahmoud Aziz on 16/08/2021.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var sizeLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var sourceLabel: UILabel!
    
    private let cache = NSCache<NSNumber, UIImage>()
    private let utilityQueue = DispatchQueue.global(qos: .utility)
    
    var photo: Photo?
    var sizes: [Size]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let photo = self.photo else {
            return
        }
        fetchSizes(photo: photo)
        imageView.kf.setImage(with: constructURL(for: photo))
        titleLabel.text = photo.title
        dateLabel.text = photo.datetaken
        sourceLabel.text = photo.ownername
    }
    
    func fetchSizes(photo: Photo) {
        let request = FlickrRequest()
        FlickrRouter.photoId = photo.id
        request.retrieveSizes({ [weak self] result in
            switch result {
            case .success(let Sizes):
                let sizesCollection = Sizes.sizes.size
                self?.sizes = sizesCollection
                print("Fetch Sizes: Successeded")
                print(Sizes)
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func constructURL(for photo: Photo) -> URL {
        guard self.photo != nil else {
            let url = URL(string: "https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg")!
            return url
        }
        let urlScheme = "https://live.staticflickr.com/\(photo.server)/\(photo.id)_\(photo.secret).jpg"
        let url = URL(string: urlScheme)
        return url ?? URL(string: "error")!
    }

}
