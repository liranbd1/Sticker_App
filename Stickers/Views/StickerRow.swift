//
//  StickerRow.swift
//  Stickers
//
//  Created by Liran on 30/12/2022.
//

import SwiftUI

struct StickerRow: View {
    @ObservedObject var images : StickersToShow
    var body: some View {
        ScrollView{
            ForEach(images.stickers) { sticker in
                NavigationLink{
                    Image(uiImage: sticker.getImage())
                        .resizable()
                        .scaledToFill()
                } label: {
                    CollectedStickerView(sticker: sticker)
                }
            }
        }
    }
}


struct StickerRow_Previews: PreviewProvider {
    static var previews: some View {
        let one_stikcer = Sticker(name: "Liran")
        let two_stickers = Sticker(name: "Daria")
        let ok = [CodableSticker(sticker: one_stikcer), CodableSticker(sticker: two_stickers)]
        StickerRow(images: StickersToShow(stickers: ok))
    }
}
