//
//  ListViewDemo.swift
//  CRUD
//
//  Created by Arman Akash on 9/7/21.
// 

import SwiftUI

struct ListViewDemo: View {
    
    @State var todos = [TodoModel]()
    
    var body: some View {
        VStack {
            List(todos) {todo in
                Text("\(todo.id)")
                Text("\(todo.title)")
                Text("\(todo.body)")
              
                    .padding([.top, .bottom], 2)
            }.onAppear{
                APICALL().getDataFromServer(completion: { todo in
                    self.todos = todo})
        }
        }
    }
}

struct ListViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

