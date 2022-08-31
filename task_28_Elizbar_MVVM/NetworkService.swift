//
//  NetworkService.swift
//  task_28_Elizbar_MVVM
//
//  Created by alta on 8/31/22.
//

import Foundation


class NetworkService {
    static var shared = NetworkService()
    
    var session = URLSession()
    var weather : Root?
    init() {
        let urlSessionConfiguration = URLSessionConfiguration.default
        let urlSession = URLSession(configuration: urlSessionConfiguration)
        self.session = urlSession
    }
    
    func getData<T: Codable>(urlString: String, comletion: @escaping (T) ->(Void)) {
        let url = URL(string: urlString)!

        session.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
            }
            guard let response = response as? HTTPURLResponse else {
                return
            }
            guard (200...299).contains(response.statusCode) else {
                print("wrong response")
                return
            }

            guard let data = data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let object = try decoder.decode(T.self, from: data)
                
                DispatchQueue.main.async {
                    comletion(object)
                    self.weather = object as? Root
                }
            } catch {
                print("decoding error")
            }
        }.resume()
    }
    func getWeather() -> Root{
        return weather!
    }
}
