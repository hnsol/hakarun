//
//  RecordList.swift
//  hakarun
//
//  Created by masatora on 2021/02/22.
//

import SwiftUI

struct RecordList: View {
    
    @State var isSheet: Bool = false
    
    //    var vitalrecord: Vitalrecord
    
    //    @State private var fruits = [
    //        "Apple",
    //        "Banana",
    //        "Papaya",
    //        "Mango"
    //    ]
    
    var body: some View {
        
        NavigationView{
            //            List {
            //                Text(vitalrecord.temperature)
            //                ForEach(
            //                    fruits,
            //                    id: \.self
            //                ) { fruit in
            //                    Text(fruit)
            //                }
            //                ForEach(
            //                    vitalrecords,
            //                    id: \.self
            //                ) { vitalrecord in
            //                    Text(vitalrecord.temperature)
            //                }
            List(vitalrecords) { vitalrecord in
                RecordRow(vitalrecord: vitalrecord)
//                Text(vitalrecord.temperature)
            }
//            .onDelete(perform: onDelete)
//            .onMove(perform: onMove)
            .navigationTitle("履歴")
            .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.inline/*@END_MENU_TOKEN@*/)
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
//    fruits.remove(atOffsets: offsets)
}

func onMove(source: IndexSet, destination: Int) {
//    fruits.move(fromOffsets: source, toOffset: destination)
}

}


struct RecordList_Previews: PreviewProvider {
    static var previews: some View {
        RecordList()
    }
}
