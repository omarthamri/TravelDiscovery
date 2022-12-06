//
//  CategoryDetailsViewModel.swift
//  TravelDiscovery
//
//  Created by omar thamri on 6/12/2022.
//

import Foundation

class CategoryDetailsViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var places = [Place]()
    @Published var errorMessage = ""
    init() {
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/category?name=art") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            do {
                self.places = try JSONDecoder().decode([Place].self,from: data)
            } catch {
                print("failed to decode json:",error)
                self.errorMessage = error.localizedDescription
            }
            self.isLoading = false
        }.resume()
        
    }
}
