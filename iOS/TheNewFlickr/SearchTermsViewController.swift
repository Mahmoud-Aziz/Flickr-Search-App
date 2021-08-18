//
//  SearchTermsViewController.swift
//  TheNewFlickr
//
//  Created by Mahmoud Aziz on 18/08/2021.
//

import UIKit

class SearchTermsViewController: UIViewController {

    @IBOutlet private weak var searchTermsTableView: UITableView!
    var searchTerms: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }
    
    private func registerCell() {
        let cellNib = UINib(nibName: "SearchTermsTableViewCell", bundle: nil)
        searchTermsTableView.register(cellNib, forCellReuseIdentifier: "SearchTermsTableViewCell")
    }
}

extension SearchTermsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchTerms?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTermsTableViewCell", for: indexPath)
        cell.textLabel?.text = searchTerms?[0]
        return cell
    }
}

extension SearchTermsViewController: UITableViewDelegate {
    
}
