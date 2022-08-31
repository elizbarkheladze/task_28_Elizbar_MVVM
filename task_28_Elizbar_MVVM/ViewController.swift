//
//  ViewController.swift
//  task_28_Elizbar_MVVM
//
//  Created by alta on 8/31/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var latTextField: UITextField!
    @IBOutlet weak var lonTextField: UITextField!
    var currentWeather: Root?
    
    var networService = NetworkService.shared
    private let viewModel = SearchWeaterViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBinders()
        
    }
    private func setUpBinders() {
        viewModel.error.bind { [weak self] error in
            if let error = error {
                print(error)
            } else {
                self?.goToDetails()
            }
        }
    }
    private func goToDetails(){
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WeatherDetailsViewController") as?  WeatherDetailsViewController
        self.currentWeather = self.viewModel.weather
        vc?.currentWeatherDetails = currentWeather
        navigationController!.present(vc!,animated: true,completion: nil)
        
    }
    @IBAction func showWeatherDetails(_ sender: UIButton) {
        if  !latTextField.text!.isEmpty && !lonTextField.text!.isEmpty {
            viewModel.fetchWeather(lat: latTextField.text!, lon: lonTextField.text!)
        } else {
            print("Fields are empty")
        }
        DispatchQueue.global().sync {
            sender.isEnabled = false
            sleep(5)
            sender.isEnabled = true
        }
    }
}

