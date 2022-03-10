//
//  DetailViewController.swift
//  weatherTut
//
//  Created by Shikhar Sharma on 04/03/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var label1 : UILabel!
    @IBOutlet var label2 : UILabel!
    
    var averageTemp1 : String = ""
    var date : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text = averageTemp1
        label2.text = date
        // Do any additional setup after loading the view.
    }

}
