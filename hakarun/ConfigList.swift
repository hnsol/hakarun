//
//  ConfigList.swift
//  hakarun
//
//  Created by masatora on 2021/02/22.
//

import SwiftUI

struct ConfigList: View {
    
    @AppStorage("selectFormat")  var selectFormat = 0
    @AppStorage("isAutDelete")   var isAutoDelete = false
    @AppStorage("selectKeep")    var selectKeep = 0
    @AppStorage("isKeepDone")    var isKeepDone = true

    let formatOption = [ "年月日", "年月日および時刻" ]
    let keepOption = [ "直近の60件", "直近の40件", "直近の20件", "5件（デバッグ用）" ]
//    let keepOption = [ "直近の60件", "直近の40件", "直近の20件" ]

    var body: some View {
        
        NavigationView {
            Form {
                
                Section(header: Text("表示").padding([.top, .leading, .trailing])) {
                    Picker("日時の表示", selection: $selectFormat, content: {
                        ForEach(0..<formatOption.count) {index in
                            Text(formatOption[index])
                        }
                    })
                }

                Section(header: Text("データ削除").padding([.top, .leading, .trailing])) {
                    Toggle("自動的に削除する", isOn: $isAutoDelete)
                    
                    if isAutoDelete {
                        Picker("残す対象", selection: $selectKeep, content: {
                            ForEach(0..<keepOption.count) { index in
                                Text(keepOption[index])
                            }
                        })
                        Toggle("未入力データは残す", isOn: $isKeepDone)
                    }
                }
            }.navigationTitle("設定").navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ConfigList_Previews: PreviewProvider {
    static var previews: some View {
        ConfigList()
    }
}
