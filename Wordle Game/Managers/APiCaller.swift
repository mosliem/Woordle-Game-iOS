//
//  APiCalller.swift
//  Wordly Game
//
//  Created by mohamedSliem on 3/8/22.
//

import Foundation

final class APiCaller {
    static let shared = APiCaller()
    private let BaseURL = "https://random-word-api.herokuapp.com/word?number=20000&swear=1"
    private init (){}
    
    public func createRequest(completion : @escaping(URLRequest) -> Void) {
        guard let url = URL(string: BaseURL) else {
            return
        }
        let request = URLRequest(url: url)
        completion(request)
    }
    public func getRandomWords(){
        createRequest { (request) in
            let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
                guard let data = data , error == nil else{
                    return
                }
                
//                do{
//                    let result = try JSONDecoder().decode(RandomWordsModel.self, from: data)
//                    print(result)
//                }
//                catch{
//                    print(error)
//                }
            }
            task.resume()
        }
    }
}
