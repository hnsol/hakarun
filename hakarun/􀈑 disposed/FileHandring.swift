//
//  FileHandring.swift
//  hakarun
//
//  Created by masatora on 2021/02/22.
//

import SwiftUI
import Foundation

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
