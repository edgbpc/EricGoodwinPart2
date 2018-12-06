//
//  rootViewController.swift
//  EricGoodwinPart2
//
//  Created by Eric Goodwin on 12/2/18.
//  Copyright © 2018 umsl. All rights reserved.
//

import UIKit

protocol MovieReceiverDelegate: class {
    func receiveMovie(movie: Movie)
}

class rootViewController: UIViewController, MovieReceiverDelegate {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearReleasedLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var studioLabel: UILabel!
    
    
    override func viewDidLoad() {
        nameLabel.text = ""
        yearReleasedLabel.text = ""
        genreLabel.text = ""
        directorLabel.text = ""
        studioLabel.text = ""
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func receiveMovie(movie: Movie){
        nameLabel.text = movie.name
        yearReleasedLabel.text = String(movie.yearReleased)
        genreLabel.text = movie.genre.description
        directorLabel.text = movie.director
        studioLabel.text = movie.studio
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is filterViewController {
            let vc = segue.destination as? filterViewController
            vc?.delegate = self
        }
    }
    
    

    @IBAction func filterButtonPressed(_ sender: Any) {
//        let filterVC: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "filterViewController")
//        self.present(filterVC, animated: true, completion: nil)
        performSegue(withIdentifier: "goToFilter", sender: self)
    }
    



}
