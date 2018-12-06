//
//  filterViewController.swift
//  EricGoodwinPart2
//
//  Created by Eric Goodwin on 12/2/18.
//  Copyright © 2018 umsl. All rights reserved.
//

import UIKit

class filterViewController: UIViewController {

    var model = filterModel()
    weak var delegate: MovieReceiverDelegate?

    
    @IBOutlet weak var filterTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is resultsViewController
        {
            let vc = segue.destination as? resultsViewController
            vc?.model.results = model.filteredMovies
            vc?.delegate = delegate
        }
    }
}


extension filterViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (FilterOption.allCases.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filterCell", for: indexPath)
        cell.textLabel?.text = FilterOption.allCases[indexPath.row].description
 
        return cell
    }
}

extension filterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        model.filterMovies(index: indexPath.row)
        performSegue(withIdentifier: "goToResults", sender: self)
    }
}





