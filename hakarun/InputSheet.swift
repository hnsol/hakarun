//
//  InputSheet.swift
//  hakarun
//
//  Created by masatora on 2021/02/22.
//

import SwiftUI

// インプットするシート

struct InputSheet: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var isSheet: Bool

    @State private var date = Date()
    @State private var temperature:String = ""
    
    var body: some View {
        
        NavigationView {
            Form {
                
                DatePicker(selection: $date, displayedComponents: .date,
                           label: { Image(systemName: "calendar.badge.plus")})
                    .environment(\.locale, Locale(identifier: "ja_JP"))
                    .padding(.all)
                
                HStack {
                    Image(systemName: "thermometer")
                    Spacer()
                    TextField(
                        "体温を入力...",
                        text: $temperature,
                        onCommit: {
                            if temperature != "" {
//                                print("01: " + temperature)
                                modelData.vitalrecords.insert(Vitalrecord(id:UUID().hashValue, date: date, temperature: temperature, isDone: false), at:0)
//                                print(modelData.vitalrecords)
//                                print("02: " + temperature)
                            }
                            isSheet = false
                        })
                        .padding([.top, .leading, .bottom])
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(/*@START_MENU_TOKEN@*/.numbersAndPunctuation/*@END_MENU_TOKEN@*/)
                    
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
            .navigationTitle("日付と体温を入力")
            .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.inline/*@END_MENU_TOKEN@*/)
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
//        InputSheet(isSheet: Binding.constant(true), date: Binding.constant(Date()), temperature: Binding.constant(""))
//        InputSheet(isSheet: Binding.constant(true), vitalrecord: Binding.vitalrecords[0])
    }
}
