//
//  ContentView.swift
//  hakarun
//
//  Created by masatora on 2021/02/16.
//

import SwiftUI
import Foundation



// キーボードを下げる
extension UIApplication {
    func endEditing() {
        sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil, from: nil, for: nil
        )
    }
}



struct TextforEditor {
    
}


struct ContentView: View {
    
    @State var selectedTag: Int = 1
        
    var body: some View {
        
        TabView(selection: $selectedTag) {
            RecordList()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("記録")
                }.tag(1)
            ConfigList()
                .tabItem {
                    Image(systemName: "gear")
                    Text("設定")
                }.tag(2)
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())

    }
}
