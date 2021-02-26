//
//  RecordRow.swift
//  hakarun
//
//  Created by masatora on 2021/02/23.
//

import SwiftUI

struct RecordRow: View {
    @Environment(\.managedObjectContext) private var viewContext
//    @EnvironmentObject(\.managedObjectContext) var viewContext
    var vitalrecord: VitalRecord

    @AppStorage("selectFormat")  var selectFormat = 0

    var dateFormat1: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        return df
    }

    var dateFormat2: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm"
        return df
    }

    // 現在のビューがどの配列に入っているか、idxを取る（Bindせず）
//    var index: Int {
//        viewContext.vitalrecords.firstIndex(where: { $0.id == vitalrecord.id })!
//        vitalrecords.firstIndex(where: { $0.id == vitalrecord.id })!
//    }

    var body: some View {

        HStack {
            
            if selectFormat == 0 {
                Text(dateFormat1.string(from: vitalrecord.timestamp!))
            } else {
//                Text("\(vitalrecord.timestamp)")
                Text(dateFormat2.string(from: vitalrecord.timestamp!))
            }
            
            Spacer()
            
            Text("\(vitalrecord.temperature!)")
            
            Spacer()
            
            if vitalrecord.isDone {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.green)
                    .onTapGesture {
//                        modelData.vitalrecords[index].isDone.toggle()
//                        vitalrecords[index].isDone.toggle()
                    }
            } else {
                Image(systemName: "checkmark.seal")
                    .foregroundColor(.gray)
                    .onTapGesture {
//                        modelData.vitalrecords[index].isDone.toggle()
//                        vitalrecords[index].isDone.toggle()
                    }
            }
        }.padding(.horizontal)
    }
}

//struct RecordRow_Previews: PreviewProvider {
//
//    static var previews: some View {
//        RecordRow(vitalrecord: ???)
//            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
////        RecordRow(vitalrecord: modelData.vitalrecords[0])
////            .environmentObject(ModelData())
//
//    }
//}
