//
//  RecordList.swift
//  hakarun
//
//  Created by masatora on 2021/02/22.
//

import SwiftUI

struct RecordList: View {
    @EnvironmentObject var modelData: ModelData
    @State var isSheet = false
    
    var body: some View {
        
        ZStack (alignment: .bottomTrailing){
            NavigationView{
                
                List {
                    ForEach(modelData.vitalrecords) {vitalrecord in
                        RecordRow(vitalrecord: vitalrecord)
                    }
                    .onDelete(perform: onDelete)
                    .onMove(perform: onMove)
                }
                .navigationTitle("履歴")
                .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.inline/*@END_MENU_TOKEN@*/)
                .navigationBarItems(trailing: EditButton())
                
            }
            .sheet(isPresented: $isSheet, onDismiss: didDismiss) {
                InputSheet(isSheet: $isSheet)
            }
            
            addButton.padding()
        }
    }
    
    private var addButton: some View {
        AnyView(Button(action: {
            isSheet = true
        }) { Image(systemName: "pencil.tip.crop.circle.badge.plus").font(.largeTitle) })
    }
    
    func onDelete(offsets: IndexSet) {
        modelData.vitalrecords.remove(atOffsets: offsets)
    }
    
    // NOTE: 移動が必要か？要検討
    func onMove(source: IndexSet, destination: Int) {
        modelData.vitalrecords.move(fromOffsets: source, toOffset: destination)
    }
    
    func didDismiss() {
//  ここではなくてonCommitで処理を書くとおもっている
//        if (newrecord.temperature != "") {
//            records.append(newrecord)
//            print(records)
//            newrecord.temperature = ""
//            vitalrecords.append(newrecord)
//            print(vitalrecords)
//        }

    }
}


struct RecordList_Previews: PreviewProvider {
    static var previews: some View {
        RecordList()
            .environmentObject(ModelData())

    }
}
