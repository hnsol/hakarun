//
//  InputSheet.swift
//  hakarun
//
//  Created by masatora on 2021/02/22.
//

import SwiftUI

// インプットするシート

struct InputSheet: View {
    @Environment(\.managedObjectContext) private var viewContext

    @Binding var isSheet: Bool

    @State private var date = Date()
    @State private var temperature:String = ""
    
    var body: some View {
        
        NavigationView {
            Form {
                
                DatePicker(selection: $date, displayedComponents: .date,
                           label: { Image(systemName: "calendar")})
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
                                // CoreDataに保存
                                let newRecord = VitalRecord(context: self.viewContext)
                                newRecord.timestamp   = date
                                newRecord.temperature = temperature
                                do {
                                    try self.viewContext.save()
                                } catch {
                                    print("whoops \(error.localizedDescription)")
                                }
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
    }
}
