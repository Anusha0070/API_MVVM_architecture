//
//  Network.swift
//  API_MVVM_architecture
//
//  Created by Anusha Raju on 12/5/24.
//


import Foundation

protocol NetworkProtocol{
    func fetchMealsData<T: Decodable>(from url: String, completion: @escaping (T) -> Void)
}

class Network{
    
    static let instance = Network()
    
    private init(){}
    
    func fetchMealsData<T: Decodable>(from url: String, completion: @escaping (T) -> Void){
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            
            guard let data, error == nil else { return }
            
            do {
                let receivedData = try JSONDecoder().decode(T.self, from: data)
                completion(receivedData)
                print("Data received")
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
        
    }
    
}
