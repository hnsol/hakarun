//
//  rev01.swift
//  hakarun
//
//  Created by masatora on 2021/02/22.
//

import SwiftUI

struct rev01: View {
    var body: some View {
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        
//        ZStack () {
//            // 背景のタップでキーボードを下げる
//            Color.white
//                .onTapGesture {
//                    UIApplication.shared.endEditing()
//                }
//            
//            VStack {
//                NavigationView {
//                    TextEditor(text: $theText)
//                        .lineSpacing(10)
//                        .border(Color.gray)
//                        .padding([.leading, .bottom, .trailing])
//                        .navigationTitle("はかるん")
//                        .toolbar {
//                            // 保存ボタン
//                            ToolbarItem(placement: .navigationBarTrailing) {
//                                Button {
//                                    UIApplication.shared.endEditing()
//                                    saveText(theText, fileNam)
//                                } label: {
//                                    Text("保存")
//                                }
//                            }
//                            // 消去ボタン
//                            ToolbarItem(placement: .navigationBarTrailing) {
//                                Button {
//                                    theText = ""
//                                } label: {
//                                    Text("消去")
//                                }
//                            }
//                        }
//                }
//                //            .frame(height: 400.0)
//                
//                HStack {
//                    DatePicker("日付", selection: $theDate, displayedComponents: .date)
//                        .frame(width: 160.0)
//                        .environment(\.locale, Locale(identifier: "ja_JP"))
//                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//                    
//                    HStack {
//                        Label("", systemImage: "thermometer")
//                        TextField("体温", text: $strTemp)
//                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//                            .frame(width: 80.0)
//                            .border(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
//                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
//                            .keyboardType(/*@START_MENU_TOKEN@*/.decimalPad/*@END_MENU_TOKEN@*/)
//                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
//                    }
//                }
//                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//                
//                HStack {
//                    Text(dateFormat1.string(from: theDate) + " " + strTemp)
//                    Button(action: {
//                        //                theText = theText + "\n" + dateFormat1.string(from: theDate) + " " + strTemp
//                        let app:String = dateFormat1.string(from: theDate) + " " + strTemp
//                        let arr:[String] = theText.components(separatedBy: "\n")
//                        
//                        if arr[0] != app {
//                            theText = app + "\n" + theText
//                            //                        theText = dateFormat1.string(from: theDate) + " " + strTemp + "\n" + theText
//                            UIApplication.shared.endEditing()
//                            saveText(theText, fileNam)
//                        }
//                        
//                    }) {
//                        Text("←を上の枠に追記")
//                    }
//                }
//                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//            }
//            
//        }
//    }

    }
}

struct rev01_Previews: PreviewProvider {
    static var previews: some View {
        rev01()
    }
}
