//
//  AllArticlesController.swift
//  CoData
//
//  Created by TRAORE Lionel on 8/13/19.
//  Copyright © 2019 TRAORE Lionel. All rights reserved.
//

import UIKit

class AllArticlesController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var liste: Liste!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var isSearching = false
    var allArticles: [Articles] = []
    
    var queryArticle: [Articles] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: articleCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: articleCell)
        
        searchBar.delegate = self
        
        //
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: Notification.Name("delete"), object: nil)

    }
    @objc func reload(){
        CoreDataHelper().allArticles(completion: { (Articles) in
            if Articles != nil {
                DispatchQueue.main.async {
                    self.allArticles = Articles!
                    self.tableView.reloadData()
                }
            }
        })
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reload()
    }
    
}


extension AllArticlesController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            isSearching = false
            tableView.reloadData()
        } else {
            isSearching = true
            CoreDataHelper().queryArticles(string: searchText) { (Articles) in
                if Articles != nil {
                    DispatchQueue.main.async {
                        self.queryArticle = Articles!
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
       // <#code#>
    }
}

extension AllArticlesController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return queryArticle.count
        } else {
            return allArticles.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: articleCell) as? MonArticleCell {
            if isSearching {
                cell.setup(queryArticle[indexPath.row])
            } else {
                cell.setup(allArticles[indexPath.row])
            }
            return cell
        }
        return UITableViewCell()
    }
}
