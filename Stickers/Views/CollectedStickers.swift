//
//  CollectedStickers.swift
//  Stickers
//
//  Created by Liran on 13/01/2023.
//

import SwiftUI

struct CollectedStickers: View {
    @ObservedObject var allStickers : StickersToShow
    var body: some View {
        ZStack{
            BackgroundView()
            StickerRow(images: allStickers)
        }
    }
}

struct CollectedStickers_Previews: PreviewProvider {
    static var previews: some View {
        CollectedStickers(allStickers: StickersToShow(stickers: [CodableSticker(sticker: Sticker.emptySelection)]))
    }
}
