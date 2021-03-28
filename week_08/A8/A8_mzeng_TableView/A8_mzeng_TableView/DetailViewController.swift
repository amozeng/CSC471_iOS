//
//  ViewController.swift
//  A8_mzeng_TableView
//
//  Created by amo on 3/2/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var countryDescription: UILabel!
    @IBOutlet weak var languages: UILabel!
    
    var country : Country?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        if let c = country {
//            flagImage.image = UIImage(named: "flag-belgium")
            let imageStr = c.flagImagePath
            flagImage.image = UIImage(named: imageStr)
            countryDescription.text = c.description
            countryDescription.sizeToFit()
            languages.text = c.language
        }
    }


}

