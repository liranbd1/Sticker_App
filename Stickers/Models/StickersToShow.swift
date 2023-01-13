//
//  StickersToShow.swift
//  Stickers
//
//  Created by Liran on 13/01/2023.
//

import Foundation

class StickersToShow : ObservableObject{
    @Published var stickers : [CodableSticker]
    
    init(stickers: [CodableSticker]) {
        self.stickers = stickers.sorted{ $0.date < $1.date}
    }
}
