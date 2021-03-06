//
//  resultsViewController.swift
//  EricGoodwinPart2
//
//  Created by Eric Goodwin on 12/2/18.
//  Copyright © 2018 umsl. All rights reserved.
//

import UIKit

class resultsViewController: UIViewController {
    
    
    var model = filterModel()
    weak var delegate: MovieReceiverDelegate?
    
    @IBOutlet weak var resultsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension resultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultsCell", for: indexPath)
        cell.textLabel?.text = model.results[indexPath.row].name
        return cell
    }
}

extension resultsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.receiveMovie(movie: model.results[indexPath.row])
        navigationController?.popToRootViewController(animated: true)
    }
}
