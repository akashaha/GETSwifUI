//
//  Network.swift
//  CRUD
//
//  Created by Arman Akash on 9/7/21.
//

import Foundation
class APICALL {
    func getDataFromServer(completion : @escaping ([TodoModel]) -> ()) {
        guard let getUrl = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        URLSession.shared.dataTask(with: getUrl){data, _, error in
            if (error == nil){
                if let todo = try?JSONDecoder().decode([TodoModel].self, from: data!) {
                    DispatchQueue.main.async {
                        completion(todo)
                    }
                }
            }
        }.resume()
    }
}
