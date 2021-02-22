//
//  InputSheet.swift
//  hakarun
//
//  Created by masatora on 2021/02/22.
//

import SwiftUI

// 最初にインプットするシートを表示する

struct InputSheet: View {
    
    @Binding var isSheet: Bool
    @State private var theDate = Date()
    
    @State var temperature:String = ""
    
    
    var body: some View {
        
        
        NavigationView {
            Form {
                
                DatePicker(selection: $theDate, displayedComponents: .date,
                           label: { Image(systemName: "calendar.badge.plus")})
                    .environment(\.locale, Locale(identifier: "ja_JP"))
                    .padding()
                
                HStack {
                    Image(systemName: "thermometer")
                    Spacer()
                    TextField(
                        "体温を入力...",
                        text: $temperature,
                        onCommit: {
                            //                        setvalues(modelData: modelData)
                            isSheet = false
                        })
                        .font(.title)
                        .padding(.leading)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(/*@START_MENU_TOKEN@*/.numbersAndPunctuation/*@END_MENU_TOKEN@*/)
                    
                }.padding()
            }
            .navigationTitle("日付と体温の入力")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("完了", action: {
                        isSheet = false
                    })
                }
            }
        }
    }
}

struct InputSheet_Previews: PreviewProvider {
    static var previews: some View {
        InputSheet(isSheet: Binding.constant(true))
    }
}
