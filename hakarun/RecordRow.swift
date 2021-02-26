//
//  RecordRow.swift
//  hakarun
//
//  Created by masatora on 2021/02/23.
//

import SwiftUI

struct RecordRow: View {
    @Environment(\.managedObjectContext) private var viewContext
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

    var body: some View {

        HStack {
            
            if selectFormat == 0 {
                Text(dateFormat1.string(from: vitalrecord.timestamp!))
            } else {
                Text(dateFormat2.string(from: vitalrecord.timestamp!))
            }
            
            Spacer()
            
            Text("\(vitalrecord.temperature!)")
            
            Spacer()
            
            if vitalrecord.isDone {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.green)
                    .onTapGesture {
                        vitalrecord.isDone.toggle()
                        // ここでCoreDateへの保存を書くべきなのかもしれないが、
                        // hakarunAppのonChangeで保存しているので、書くのをやめておく
                        // いつか保存されない現象が起きそうな気もする
                    }
            } else {
                Image(systemName: "checkmark.seal")
                    .foregroundColor(.secondary)
                    .onTapGesture {
                        vitalrecord.isDone.toggle()
                        // ここでCoreDateへの保存を書くべきなのかもしれないが、
                        // hakarunAppのonChangeで保存しているので、書くのをやめておく
                        // いつか保存されない現象が起きそうな気もする
                    }
            }
        }.padding(.horizontal)
    }
}

//struct RecordRow_Previews: PreviewProvider {
//    @Environment(\.managedObjectContext) private var viewContext
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \VitalRecord.timestamp, ascending: false)],
//        animation: .default)
//    private var vitalrecords: FetchedResults<VitalRecord>
//    
//    static var previews: some View {
//        RecordRow(vitalrecord: PersistenceController.preview.container.)
//            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//        //        RecordRow(vitalrecord: modelData.vitalrecords[0])
//        //            .environmentObject(ModelData())
//        
//    }
//}
