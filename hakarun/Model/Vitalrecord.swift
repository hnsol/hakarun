//
//  Vitalrecord.swift
//  hakarun
//
//  Created by masatora on 2021/02/22.
//

import Foundation
import SwiftUI

struct Vitalrecord: Hashable, Codable, Identifiable {
    var id: Int
    var date: Date
    var temperature: String
    var isDone: Bool
}
