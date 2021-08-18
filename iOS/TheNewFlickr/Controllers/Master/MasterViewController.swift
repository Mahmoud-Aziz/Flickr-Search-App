//
//  MasterViewController.swift
//  TheNewFlickr
//
//  Created by Mahmoud Aziz on 16/08/2021.
//

import UIKit

class MasterViewController: UIViewController {
    
    @IBOutlet private weak var masterCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private let cache = NSCache<NSNumber, UIImage>()
    private let utilityQueue = DispatchQueue.global(qos: .utility)
    
    var images: [Photo]?
    var searchTerms: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.showsCancelButton = false
        searchBar.delegate = self
        navigationController?.navigationBar.topItem?.title = "The New Flickr"
        navigationController?.navigationBar.prefersLargeTitles = true
        registerCell()
        masterCollectionView.isHidden = true
        searchBar.showsSearchResultsButton = true
    }
    
    //MARK:- Helpers Methods:
    
    private func fetchImages(query: String) {
        let request = FlickrRequest()
        FlickrRouter.searchQuery = query
        request.retrieveAllPhotos({ [weak self] result in
            switch result {
            case .success(let flickr):
                let photoCollection = flickr.photos.photo
                self?.images = photoCollection
                self?.masterCollectionView.reloadData()
                print("Fetch Images: Successeded")
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    private func constructURL(for index: Int) -> URL {
        guard self.images?.count != 0 else {
            let url = URL(string: "https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg")!
            return url
        }
        let photoIndex = self.images?[index]
        let urlScheme = "https://live.staticflickr.com/\(photoIndex?.server ?? "")/\(photoIndex?.id ?? "")_\(photoIndex?.secret ?? "").jpg"
        let url = URL(string: urlScheme)
        return url ?? URL(string: "error")!
    }
    
    private func registerCell() {
        let cellNib = UINib(nibName: "MasterCollectionViewCell", bundle: nil)
        masterCollectionView.register(cellNib, forCellWithReuseIdentifier: "MasterCollectionViewCell")
    }
    
    //MARK:- Images Caching Methods:
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        guard let cell = cell as? MasterCollectionViewCell else { return }
        
        let itemNumber = NSNumber(value: cell.id)
        
        if let cachedImage = self.cache.object(forKey: itemNumber) {
            print("Using a cached image for item: \(itemNumber)")
            cell.imageView.image = cachedImage
        } else {
            self.loadImage(for: indexPath.item) { [weak self] (image) in
                guard let self = self, let image = image else { return }
                cell.imageView.image = nil
                cell.imageView.image = image
                self.cache.setObject(image, forKey: itemNumber)
            }
        }
    }
    
    private func loadImage( for index: Int, completion: @escaping (UIImage?) -> ()) {
        utilityQueue.async {
            let url = self.constructURL(for: index)
            
            guard let data = try? Data(contentsOf: url) else { return }
            let image = UIImage(data: data)
            
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
}

//MARK:- CollectionView Datasource Methods:

extension MasterViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.images?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MasterCollectionViewCell", for: indexPath) as! MasterCollectionViewCell
        let representedIdentifier = images?[indexPath.item].id
        cell.cellIdentifier = representedIdentifier
        cell.id = Int(representedIdentifier ?? "") ?? 0
        let url = constructURL(for: indexPath.row)
        cell.configure(url: url, id: representedIdentifier)
        return cell
    }
}

//MARK:- CollectionView Delegate Method:

extension MasterViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destinationVC = DetailsViewController()
        destinationVC.photo = self.images?[indexPath.row]
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
}

//MARK:- Searchbar Delegate Methods:

extension MasterViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else {
            masterCollectionView.isHidden = true
            return
        }
        self.searchTerms?.append(text)
        images = []
        searchBar.showsCancelButton = true
        masterCollectionView.isHidden = false
        searchBar.resignFirstResponder()
        self.fetchImages(query: text)
    }
    
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        let vc = SearchTermsViewController()
        vc.modalPresentationStyle = .popover
        vc.searchTerms? = self.searchTerms ?? []
        self.navigationController?.present(vc, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        images = []
        searchBar.text = ""
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
        masterCollectionView.reloadData()
        masterCollectionView.isHidden = true
    }
}

