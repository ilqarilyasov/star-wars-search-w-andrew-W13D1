//
//  PersonController.swift
//  Star Wars Search
//
//  Created by Ilgar Ilyasov on 11/26/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

private let baseURL = URL(string: "https://swapi.co/api/people")!

class PersonController: NSObject {
    
    static let shared = PersonController()
    
    func searchForPeaople(with searchTerm: String, completion: @escaping ([IIIPerson]?, Error?) -> Void)
    {
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        let searchItem = URLQueryItem(name: "search", value: searchTerm)
        components.queryItems = [searchItem]
        let url = components.url!
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                return completion(nil, error)
            }
            
            guard let data = data else {
                return completion(nil, NSError())
            }
            
            do {
                guard let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any],
                    let personDictionaries = dictionary["results"] as? [[String: Any]] else { throw NSError() }
                
                let people = personDictionaries.compactMap({IIIPerson(dictionary: $0)})
                completion(people, nil)
            } catch {
                return completion(nil, error)
            }
            
            
        }.resume()
    }

}
