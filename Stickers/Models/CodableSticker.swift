//
//  CodableSticker.swift
//  Stickers
//
//  Created by Liran on 13/01/2023.
//

import Foundation
import SwiftUI
import Photos

class CodableSticker: Codable, ObservableObject{
    
    let id: String
    let name: String
    let image : Data
    let emoji : String
    let date : Date
    
    init(sticker : Sticker) {
        self.id = sticker.id
        self.name = sticker.name ?? ""
        self.image = sticker.image?.pngData() ?? Data()
        self.emoji = sticker.emoji 
        self.date = sticker.date!
    }

    func getDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY - HH:mm"
        return dateFormatter.string(from: self.date)
    }
    
    func getImage() -> UIImage{
        return UIImage(data: self.image) ?? UIImage()        
    }
}

extension CodableSticker : Identifiable{
    public static func == (lhs: CodableSticker, rhs: CodableSticker) -> Bool {
        return lhs.id == rhs.id
    }
}
