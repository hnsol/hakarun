//
//  ConfigList.swift
//  hakarun
//
//  Created by masatora on 2021/02/22.
//

import SwiftUI

struct ConfigList: View {
    
    @State var isAutoDelete = false
    @State var selectKeep = 1
    @State var isKeepBeforeInput = true

//    var vitalrecords: Vitalrecord = [ date: date(), temperature:  ]
    let keepOption = [ "直近20件", "直近40件", "直近30日", "直近60日"]
    
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
                    Toggle(isOn: $isKeepBeforeInput) {
                        Text("未入力データは残しておく")
                    }
                }
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
