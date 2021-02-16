//
//  ContentView.swift
//  hakarun
//
//  Created by masatora on 2021/02/16.
//

import SwiftUI

// 保存ファイルへのURLをつくる
func docURL(_ fileName:String) -> URL? {
    let fileManager = FileManager.default
    do {
        // Documentsフォルダ
        let docsUrl = try fileManager.url(
            for: .documentDirectory,
            in:  .userDomainMask,
            appropriateFor: nil,
            create: false)
        // URLをつくる
        let url = docsUrl.appendingPathComponent(fileName)
        return url
    } catch {
        return nil
    }
}

// テキストデータを保存する
func saveText(_ textData:String, _ fileName:String) {
    // URLを得られたらアンラップしてurlに代入
    guard let url = docURL(fileName) else {
        return
    }
    // ファイルパスへの保存
    do {
        let path = url.path
        try textData.write(toFile: path, atomically: true, encoding: .utf8)
    } catch let error as NSError {
        print(error)
    }
}

// テキストデータを読み込んで戻す
func loadText(_ fileName:String) -> String? {
    // URLを得られたらアンラップしてurlに代入
    guard let url = docURL(fileName) else {
        return nil
    }
    // urlからの読み込み
    do {
        let textData = try String(contentsOf: url, encoding: .utf8)
        return textData
    } catch {
        return nil
    }

}

// キーボードを下げる
extension UIApplication {
    func endEditing() {
        sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil, from: nil, for: nil
        )
    }
}



struct ContentView: View {
    @State var theText: String = ""
    @State var strTemp: String = "36.1"
    @State var theDate = Date()

    // 日付書式
    var dateFormat1: DateFormatter {
        let df = DateFormatter()
//        df.locale = Locale(identifier: "ja_JP")
        df.dateFormat = "yyyy-MM-dd"
        return df
    }

    var body: some View {
        
        VStack {
            NavigationView {
                TextEditor(text: $theText)
                    .lineSpacing(10)
                    .border(Color.gray)
                    .padding([.leading, .bottom, .trailing])
                    .navigationTitle("はかるん")
                    .toolbar {
                        // 読み込みボタン
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                if let data = loadText("sample.txt") {
                                    theText = data
                                }
                            } label: {
                                Text("読み込み")
                            }
                        }
                        // 保存ボタン
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                UIApplication.shared.endEditing()
                                saveText(theText, "sample.txt")
                            } label: {
                                Text("保存")
                            }
                        }
                    }
            }
            .frame(height: 300.0)

            HStack {
                DatePicker("日付", selection: $theDate, displayedComponents: .date)
                    .frame(width: 170.0)
                    .environment(\.locale, Locale(identifier: "ja_JP"))
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)

                HStack {
                    Label("体温", systemImage: "thermometer")
                    TextField("体温", text: $strTemp)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .frame(width: 80.0)
                        .border(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .keyboardType(/*@START_MENU_TOKEN@*/.decimalPad/*@END_MENU_TOKEN@*/)
                }
                
                }
            
            
            Text(dateFormat1.string(from: theDate))
//            Text(theDate.description(with: Locale(identifier: "ja_JP")))
//                .font(.footnote)
        }
        
        
    }
            
        
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
