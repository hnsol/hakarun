//
//  RecordList.swift
//  hakarun
//
//  Created by masatora on 2021/02/22.
//

import SwiftUI
import CoreData

struct RecordList: View {

    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \VitalRecord.timestamp, ascending: false)],
        animation: .default)
    private var vitalrecords: FetchedResults<VitalRecord>

    @State var isSheet = false
    @State private var editMode = EditMode.inactive
    
    // TODO: AppStorageを使うコードはのちほど作成
    @AppStorage("isAutDelete") var isAutoDelete = false
    @AppStorage("selectKeep")  var selectKeep = 1
    @AppStorage("isKeepDone")  var isKeepDone = true

    var body: some View {
        
//        ZStack (alignment: .bottomTrailing){
            NavigationView{
                
                List {
//                    ForEach(vitalrecords, id: \.self) {vitalrecord in
                    ForEach(vitalrecords) {vitalrecord in
                        RecordRow(vitalrecord: vitalrecord)
                    }
                    .onDelete(perform: onDelete)
                }
                .navigationTitle("履歴")
                .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.inline/*@END_MENU_TOKEN@*/)
//                .navigationBarItems(trailing: EditButton())
                .navigationBarItems(leading: EditButton(), trailing: addButton)
                .environment(\.editMode, $editMode)
                
            }
            .sheet(isPresented: $isSheet) {
                InputSheet(isSheet: $isSheet)
            }
            
//            addButton.padding()
        }
//    }
    
    private var addButton: some View {
        // editModeに入ったときに、データ追加ビューに飛ぶとおかしくなるので
        // switchで消すことが必要！
        switch editMode {
        case .inactive:
            return AnyView(Button(action: {
                if isAutoDelete { autoDelete() }
                isSheet = true
                //            }) { Image(systemName: "square.and.pencil").font(.title) })
//            }) { Image(systemName: "calendar.badge.plus").font(.largeTitle) })
            }) { Image(systemName: "calendar.badge.plus").font(.title) })
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
    
    func autoDelete() {
        // とりあえずハードコーディング
        for index in 5..<vitalrecords.count {
            let delRecord = vitalrecords[index]
            viewContext.delete(delRecord)
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
}


struct RecordList_Previews: PreviewProvider {

    static var previews: some View {
        RecordList().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)

    }
}
