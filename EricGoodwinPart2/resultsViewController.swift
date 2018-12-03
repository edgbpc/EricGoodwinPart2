//
//  resultsViewController.swift
//  EricGoodwinPart2
//
//  Created by Eric Goodwin on 12/2/18.
//  Copyright © 2018 umsl. All rights reserved.
//

import UIKit

class resultsViewController: UIViewController {
    
    var filteredMovies: [Movie] = []
    weak var delegate: MovieReceiverDelegate?
    @IBOutlet weak var resultsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension resultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultsCell", for: indexPath)
        cell.textLabel?.text = filteredMovies[indexPath.row].name
        return cell
    }
}

extension resultsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.receiveMovie(movie: filteredMovies[indexPath.row])
        navigationController?.popToRootViewController(animated: true)
    }
}
