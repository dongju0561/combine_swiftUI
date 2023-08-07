//
//  ViewModel.swift
//  combine_swiftUI_practice
//
//  Created by Dongju Park on 2023/08/07.
//

import Foundation

class ExampleViewModel: ObservableObject {
    
    private var networkService: NetworkService
    @Published var data: ExampleData?
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchData() {
        networkService.fetchData(from: "https://your-api-url.com") { (result: Result<ExampleData, Error>) in
            switch result {
            case .success(let data):
                self.data = data
            case .failure(let error):
                print("Failed to fetch data: \(error)")
            }
        }
    }
}

