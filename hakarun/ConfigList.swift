//
//  ConfigList.swift
//  hakarun
//
//  Created by masatora on 2021/02/22.
//

import SwiftUI

struct ConfigList: View {
    
//    @State var isAutoDelete = false
//    @State var selectKeep = 1
//    @State var isKeepBeforeInput = true
    @AppStorage("isAutDelete") var isAutoDelete = false
    @AppStorage("selectKeep")  var selectKeep = 0
    @AppStorage("isKeepDone")  var isKeepDone = true
    @AppStorage("selectFormat")  var selectFormat = 0

    
//    var vitalrecords: Vitalrecord = [ date: date(), temperature:  ]
    let keepOption = [ "直近40件", "直近20件", "直近60日", "直近30日" ]
    let formatOption = [ "年月日", "年月日＋時刻" ]

    var body: some View {
        
        NavigationView {
            Form {
                
                
                Toggle(isOn: $isAutoDelete) {
                    Text("自動的に削除する")
                }
                if isAutoDelete {
                    Picker(selection: $selectKeep, label: Text("残す対象")) {
                        ForEach(0..<keepOption.count) { index in
                            Text(keepOption[index])
                        }.animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                    }
                    Toggle(isOn: $isKeepDone) {
                        Text("未入力データも残しておく")
                    }
                }
                
                // TODO: Pickerの書き方が上と違うのはいつか揃える
                Picker("日時の表示", selection: $selectFormat, content: {
                    ForEach(0..<formatOption.count) {index in
                        Text(formatOption[index])
                    }
                })
            
            }
            .navigationTitle("設定").navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.inline/*@END_MENU_TOKEN@*/)
        }
    }
}

struct ConfigList_Previews: PreviewProvider {
    static var previews: some View {
        ConfigList()
    }
}
