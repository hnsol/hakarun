//
//  RecordList.swift
//  hakarun
//
//  Created by masatora on 2021/02/22.
//

import SwiftUI

struct RecordList: View {
    
    @State var isSheet: Bool = true

    @State private var fruits = [
        "Apple",
        "Banana",
        "Papaya",
        "Mango"
    ]
    
    var body: some View {
        
        NavigationView{
            List {
                ForEach(
                    fruits,
                    id: \.self
                ) { fruit in
                    Text(fruit)
                }
                .onDelete(perform: onDelete)
                .onMove(perform: onMove)
            }
            .navigationTitle("履歴")
            .navigationBarItems(leading: EditButton(), trailing: addButton)
        }
        .sheet(isPresented: $isSheet) {
            InputSheet(isSheet: $isSheet)
        }
    }
    
    private var addButton: some View {
        AnyView(Button(action: {
         isSheet = true
        }) { Image(systemName: "plus") })
    }
        
    func onDelete(offsets: IndexSet) {
        fruits.remove(atOffsets: offsets)
    }

    func onMove(source: IndexSet, destination: Int) {
        fruits.move(fromOffsets: source, toOffset: destination)
    }
    
}


struct RecordList_Previews: PreviewProvider {
    static var previews: some View {
        RecordList()
    }
}
