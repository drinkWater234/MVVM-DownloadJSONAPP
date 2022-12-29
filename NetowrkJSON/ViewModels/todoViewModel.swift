//
//  todoViewModel.swift
//  NetowrkJSON
//
//  Created by Consultant on 12/29/22.
//

import Foundation

class todoViewModel
{
    private var getJSONService : downloadAndParseJSON!
    var todoList : [todo]!
    {
        didSet
        {
            self.bindTodoViewModelToController()
        }
    }
    
    var bindTodoViewModelToController : (() -> Void) = {}
    
    init()
    {
        self.getJSONService = downloadAndParseJSON()
        callToGetJSONData()
    }
    
    func callToGetJSONData()
    {
        self.getJSONService.getTodoList
        {
            todoList in
            self.todoList = todoList
            print(self.todoList!)
        }
    }
    
}
