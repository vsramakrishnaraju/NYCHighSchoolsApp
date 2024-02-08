//
//  SchoolViewModel.swift
//  NYCHighSchools
//
//  Created by Venkata on 2/8/24.
//

import Foundation

struct School: Decodable, Identifiable {
    let id: String
    let school_name: String
    let overview_paragraph: String
}

class SchoolViewModel: ObservableObject {
    @Published var schools = [School]()
    
    func fetchSchools() {
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let data = data {
                    let decodedData = try JSONDecoder().decode([School].self, from: data)
                    DispatchQueue.main.async {
                        self.schools = decodedData
                    }
                } else {
                    print("No data")
                }
            } catch {
                print("Error: \(error)")
            }
        }.resume()
    }
}
