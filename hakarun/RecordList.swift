//
//  RecordList.swift
//  hakarun
//
//  Created by masatora on 2021/02/22.
//

import SwiftUI

struct RecordList: View {
    @EnvironmentObject var modelData: ModelData
    @State var isSheet = true
    @State private var editMode = EditMode.inactive

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
                .environment(\.editMode, $editMode)
                
            }
            .sheet(isPresented: $isSheet, onDismiss: didDismiss) {
                InputSheet(isSheet: $isSheet)
            }
            
            addButton.padding()
        }
    }
    
//    private var addButton: some View {
//        switch editMode {
//        case .inactive:
//            return AnyView(Button(action: onAdd) { Image(systemName: "plus") })
//        default:
//            return AnyView(EmptyView())
//        }
//    }

    private var addButton: some View {
        switch editMode {
        case .inactive:
            return AnyView(Button(action: {
                isSheet = true
            }) { Image(systemName: "pencil.tip.crop.circle.badge.plus").font(.largeTitle) })
        default:
            return AnyView(EmptyView())
        }
    }
    
    func onDelete(offsets: IndexSet) {
        modelData.vitalrecords.remove(atOffsets: offsets)
    }
    
    // NOTE: 移動が必要か？要検討
    func onMove(source: IndexSet, destination: Int) {
        modelData.vitalrecords.move(fromOffsets: source, toOffset: destination)
    }
    
    func didDismiss() {
//  ここではなくてonCommitで処理を書くようにした

    }
}


struct RecordList_Previews: PreviewProvider {
    static var previews: some View {
        RecordList()
            .environmentObject(ModelData())

    }
}
