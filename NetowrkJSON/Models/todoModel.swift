//
//  todoModel.swift
//  NetowrkJSON
//
//  Created by Consultant on 12/29/22.
//

import Foundation


struct todo : Decodable
{
    var userId : Int
    var id : Int
    var title : String
    var completed : Bool
}
