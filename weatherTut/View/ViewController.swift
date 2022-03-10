//
//  ViewController.swift
//  weatherTut
//
//  Created by Shikhar Sharma on 02/03/22.
//

import UIKit

class ViewController: UIViewController {
    
//    let defaultCity = "New Delhi"
    var tempList : [WeatherDescription] = []
    
    let viewModel = WeatherViewModel()
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet var tableView : UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.delegate = self
        tableView?.dataSource = self
        // Do any additional setup after loading the view.
//        ApiFunctions.fetchWeatherData(city: "New Delhi", completion: {data in
//            self.tempList = data.list
//            self.tableView?.reloadData()
//        })
        // data binding
        viewModel.locationName.bind { [weak self] locationName in
            self?.locationLabel.text = locationName
        }
        viewModel.tempDescriptionList.bind { [weak self] tempDiscList in
            self?.tempList = tempDiscList
            self?.tableView?.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController{
            self.navigationController?.pushViewController(vc, animated: true)
            vc.date = self.tempList[indexPath.row].dt
            vc.averageTemp1 = "\(String(self.tempList[indexPath.row].temp.average - 273)) C"
        }
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tempList.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = String(Int(self.tempList[indexPath.row].temp.average) - 273)
        return cell!
    }
}

