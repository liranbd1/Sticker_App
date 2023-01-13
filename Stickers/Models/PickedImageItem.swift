//
//  PickedImageItem.swift
//  Stickers
//
//  Created by Liran on 01/01/2023.
//

import Foundation
import SwiftUI

class PickedImageItem : ObservableObject{
    
    @Published var item = Sticker()
    
    func clear(){
        item = Sticker()
    }
    
    func isItemReady() ->Bool{
        return item.emoji != "" && item.image != nil
    }
}
