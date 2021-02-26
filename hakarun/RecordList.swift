//
//  RecordList.swift
//  hakarun
//
//  Created by masatora on 2021/02/22.
//

import SwiftUI
import CoreData

struct RecordList: View {

//    @EnvironmentObject var modelData: ModelData
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \VitalRecord.timestamp, ascending: true)],
        animation: .default)
    private var vitalrecords: FetchedResults<VitalRecord>

    @State var isSheet = true
    @State private var editMode = EditMode.inactive
    
    // TODO: AppStorageを使うコードはのちほど作成
    @AppStorage("isAutDelete") var isAutoDelete = false
    @AppStorage("selectKeep")  var selectKeep = 1
    @AppStorage("isKeepDone")  var isKeepDone = true

    var body: some View {
        
        ZStack (alignment: .bottomTrailing){
            NavigationView{
                
                List {
                    //                    ForEach(modelData.vitalrecords) {vitalrecord in
                    ForEach(vitalrecords, id: \.self) {vitalrecord in
                        //                        RecordRow(vitalrecord: vitalrecord)
                        Text("\(vitalrecord.temperature!)")
                        //                    Text("\(vitalrecords[0].temperature!)")
                        //                    Text("\(vitalrecords[1].temperature!)")
                    }
                    //                    .onDelete(perform: onDelete)
                    //                    .onMove(perform: onMove)
                    
                }
                .navigationTitle("履歴")
                .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.inline/*@END_MENU_TOKEN@*/)
                .navigationBarItems(trailing: EditButton())
                .environment(\.editMode, $editMode)
                
            }
            .sheet(isPresented: $isSheet) {
                InputSheet(isSheet: $isSheet)
            }
            
            addButton.padding()
        }
    }
    
    
    private var addButton: some View {
        // editModeに入ったときに、データ追加ビューに飛ぶとおかしくなるので
        // switchで消すことが必要！
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
//        modelData.vitalrecords.remove(atOffsets: offsets)
    }
    
    // NOTE: 移動機能が必要か？要検討
    func onMove(source: IndexSet, destination: Int) {
//        modelData.vitalrecords.move(fromOffsets: source, toOffset: destination)
    }
    
//    ここではなくてonCommitで処理を書くようにした
//    func didDismiss() {
//    }

}


struct RecordList_Previews: PreviewProvider {

    static var previews: some View {
        RecordList().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//            .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            .environmentObject(ModelData())

    }
}
