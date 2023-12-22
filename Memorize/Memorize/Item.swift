//
//  Item.swift
//  Memorize
//
//  Created by Павел Таганкин on 2023-12-21.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
