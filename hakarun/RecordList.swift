//
//  RecordList.swift
//  hakarun
//
//  Created by masatora on 2021/02/22.
//

import SwiftUI

struct RecordList: View {
    
    @State var isSheet = false
    @State var records = [ Vitalrecord(id: 1001, date: Date(), temperature: "36.1", isDone: false),
                           Vitalrecord(id: 1002, date: Date(), temperature: "36.2", isDone: false) ]
    @State private var newrecord = Vitalrecord(id: 1003, date: Date(), temperature: "", isDone: false)
    
    
    var body: some View {
        
        ZStack (alignment: .bottomTrailing){
            NavigationView{
                
                List {
//                    ForEach(vitalrecords) {vitalrecord in
//                        RecordRow(vitalrecord: vitalrecord)
                    ForEach(records) {record in
                        RecordRow(vitalrecord: record)
                    }
                    .onDelete(perform: onDelete)
                    //                .onMove(perform: onMove)
                }
                .navigationTitle("履歴")
                .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.inline/*@END_MENU_TOKEN@*/)
//                .navigationBarItems(leading: EditButton(), trailing: addButton)
                .navigationBarItems(trailing: EditButton())
                
            }
            .sheet(isPresented: $isSheet, onDismiss: didDismiss) {
                InputSheet(isSheet: $isSheet, date: $newrecord.date, temperature: $newrecord.temperature)
            }
            
            addButton.padding()
        }
    }
    
    private var addButton: some View {
        AnyView(Button(action: {
            isSheet = true
        }) { Image(systemName: "plus.square.fill").font(.largeTitle) })
    }
    
    func onDelete(offsets: IndexSet) {
        //    fruits.remove(atOffsets: offsets)
    }
    
    //func onMove(source: IndexSet, destination: Int) {
    //    fruits.move(fromOffsets: source, toOffset: destination)
    //}
    
    func didDismiss() {
        if (newrecord.temperature != "") {
            records.append(newrecord)
            print(records)
            newrecord.temperature = ""
//            vitalrecords.append(newrecord)
//            print(vitalrecords)
        }

    }
}


struct RecordList_Previews: PreviewProvider {
    static var previews: some View {
        RecordList()
    }
}
