//
//  RecordRow.swift
//  hakarun
//
//  Created by masatora on 2021/02/23.
//

import SwiftUI

struct RecordRow: View {
//    @EnvironmentObject var modelData: ModelData
    var vitalrecord: Vitalrecord

    var dateFormat1: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        return df
    }
//    // 現在のビューがどの配列に入っているか、idxを取る（Bindせず）
//    var ingIdx: Int {
//        modelData.ingredients.firstIndex(where: { $0.id == ingredient.id })!
//    }

    
    var body: some View {
        HStack {
            Text(dateFormat1.string(from: vitalrecord.date))

            Spacer()

            Text("\(vitalrecord.temperature)")

            Spacer()
            
            if vitalrecord.isDone {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.green)
            } else {
                Image(systemName: "checkmark.seal")
                    .foregroundColor(.gray)
            }
        }.padding(.horizontal)
    }
}

struct RecordRow_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        RecordRow(vitalrecord: modelData.vitalrecords[0])
            .environmentObject(ModelData())

    }
}
