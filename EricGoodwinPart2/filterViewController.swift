//
//  filterViewController.swift
//  EricGoodwinPart2
//
//  Created by Eric Goodwin on 12/2/18.
//  Copyright © 2018 umsl. All rights reserved.
//

import UIKit

class filterViewController: UIViewController {

    var filtersModel = filterModel()
    var filteredMovies: [Movie] = []
    weak var delegate: MovieReceiverDelegate?

    
    
    
    @IBOutlet weak var filterTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(movies)
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is resultsViewController
        {
            let vc = segue.destination as? resultsViewController
            vc?.filteredMovies = filteredMovies
            vc?.delegate = delegate
        }
    }
    
    func filterMovies(index filter: Int){
        print(filter)
        if filter < 5 {
            filteredMovies = movies.filter { $0.boxOffice == FilterOption.allCases[filter]}
        } else {
            filteredMovies = movies.filter {$0.genre == FilterOption.allCases[filter]}
        }
        print(filteredMovies)
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
        filterMovies(index: indexPath.row)
        performSegue(withIdentifier: "goToResults", sender: self)
    }
}





