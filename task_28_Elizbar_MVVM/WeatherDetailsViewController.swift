//
//  WeatherDetailsViewController.swift
//  task_28_Elizbar_MVVM
//
//  Created by alta on 8/31/22.
//

import UIKit

class WeatherDetailsViewController: UIViewController {

    @IBOutlet weak var fellsLIkeLbl: UILabel!
    @IBOutlet weak var locationWeatherLbl: UILabel!
    @IBOutlet weak var locationTempLbl: UILabel!
    @IBOutlet weak var LocationNameLbl: UILabel!
    var currentWeatherDetails: Root?
    override func viewDidLoad() {
        super.viewDidLoad()
        fellsLIkeLbl.text = "Feels Like : \(currentWeatherDetails!.main.feelsLike)"
        locationWeatherLbl.text = "Humidity is :\(currentWeatherDetails!.main.humidity)"
        locationTempLbl.text = "Temperature : \(currentWeatherDetails!.main.temp)"
        LocationNameLbl.text = "\(currentWeatherDetails!.name)"
    }
}
