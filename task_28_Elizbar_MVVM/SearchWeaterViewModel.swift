//
//  SearchWeaterViewModel.swift
//  task_28_Elizbar_MVVM
//
//  Created by alta on 8/31/22.
//

import Foundation

final class SearchWeaterViewModel {
    var error : ObservableObject<String?> = ObservableObject("invalid")
    var weather: Root?
    let semaphore = DispatchSemaphore(value: 1)
    func fetchWeather(lat:String,lon:String) {
        let latRange = -90...90
        let lonRange = -180...180
        if latRange.contains(Int(lat)!) && lonRange.contains(Int(lon)!) {
            let queue = OperationQueue()
            let api = "20daf84383617aad27f9f795701401f8"
            let operation1 = BlockOperation {
                NetworkService.shared.getData(urlString: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(api)") { [weak self]  (item:Root)  in
                }
                sleep(5)
            }
            let operation2 = BlockOperation {
                self.getWeather()
            }
            operation2.addDependency(operation1)
            queue.addOperation(operation1)
            queue.addOperation(operation2)
        } else {
            self.error.value = "wrong Numbers entered"
        }
    }
    func getWeather() {
        let currentWeather = NetworkService.shared.getWeather()
        self.weather = currentWeather
        DispatchQueue.main.async {
            self.error.value = nil
        }
    }
}
