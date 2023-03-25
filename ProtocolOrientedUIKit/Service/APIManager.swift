//
//  APIManager.swift
//  ProtocolOrientedUIKit
//
//  Created by Muhammet Kadir on 26.03.2023.
//

import Foundation

protocol UserService{
    func fetchUser(completion : @escaping(Result<User,Error>) -> Void)
}

class APIManager : UserService{
    
    func fetchUser(completion : @escaping(Result<User,Error>) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            DispatchQueue.main.async {
                if let user = try? JSONDecoder().decode([User].self, from: data).first {
                    completion(.success(user))
                }else{
                    completion(.failure(NSError()))
                }
            }
        }.resume()
    }
    
    
}
