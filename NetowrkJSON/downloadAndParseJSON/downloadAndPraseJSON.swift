//
//  downloadAndPraseJSON.swift
//  NetowrkJSON
//
//  Created by Consultant on 12/29/22.
//

import Foundation

class downloadAndParseJSON
{
    private let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
    
    func getTodoList(callback : @escaping ([todo]) -> Void)
    {
        URLSession.shared.dataTask(with: url)
        {
            (data, response, error) in
            if let data
            {
                let decoder = JSONDecoder()
                do
                {
                    let todoData = try decoder.decode([todo].self, from: data)
                    callback(todoData)
                } catch { print(error) }
                
            }
        }.resume()
    }
}
