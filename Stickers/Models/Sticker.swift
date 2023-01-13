//
//  Sticker.swift
//  Stickers
//
//  Created by Liran on 30/12/2022.
//

import Foundation
import SwiftUI
import Photos

class Sticker : ObservableObject{
    
    var id: String
    var name: String?
    var image : UIImage?
    var emoji : String
    var date : Date?
    
    init(name: String? = nil, image: UIImage? = nil) {
        self.id = UUID().uuidString
        self.name = name
        self.image = image
        self.emoji = ""
        self.date = Date()
    }
    
    
    func getDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY - HH:mm"
        return dateFormatter.string(from: self.date ?? Date())
    }
    
    static let emptySelection = Sticker(name: "")
    
}


extension Sticker : Identifiable, Hashable{
    public func hash(into hasher: inout Hasher) {
            return hasher.combine(id)
    }
        
    public static func == (lhs: Sticker, rhs: Sticker) -> Bool {
        return lhs.id == rhs.id
    }
}
