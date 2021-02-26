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
                    ForEach(vitalrecords, id: \.self) {vitalrecord in
                        RecordRow(vitalrecord: vitalrecord)
                    }
                    .onDelete(perform: onDelete)
                    // 移動機能はなくす
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
        withAnimation {
            offsets.map { vitalrecords[$0] }.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    // NOTE: 移動機能が必要か？要検討
//    func onMove(source: IndexSet, destination: Int) {
//        modelData.vitalrecords.move(fromOffsets: source, toOffset: destination)
//    }
    

}


struct RecordList_Previews: PreviewProvider {

    static var previews: some View {
        RecordList().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//            .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            .environmentObject(ModelData())

    }
}
