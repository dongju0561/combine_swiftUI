//
//  Network.swift
//  combine_swiftUI_practice
//
//  Created by Dongju Park on 2023/08/07.
//

import Foundation
import Alamofire

class NetworkService{
    func fetchData<T: Decodable>(from url: String, completion: @escaping (Result<T, Error>) -> Void) {
            
        AF.request(url).responseDecodable(of: T.self) { (response: AFDataResponse<T>) in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
