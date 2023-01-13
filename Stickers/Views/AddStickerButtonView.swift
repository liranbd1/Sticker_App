//
//  AddStickerButtonView.swift
//  Stickers
//
//  Created by Liran on 30/12/2022.
//

import SwiftUI

struct AddStickerButtonView: View {
    @ObservedObject var collectedStickers : StickersToShow
    var body: some View {
        NavigationLink("How do you feel today?", destination: StickerSelectionView(collectedSticker: collectedStickers)
        )
            .buttonStyle(PlainButtonStyle())
            .frame(width: 140, height: 140)
            .background(Color(hex: 0xF8D1EE).opacity(0.6))
            .foregroundColor(Color(hex: 0xC109C4))
            .cornerRadius(90)
            .multilineTextAlignment(.center)
            .font(.title)
    }
}

struct AddStickerButtonView_Previews: PreviewProvider {
    static var previews: some View {
        var stickers = StickersToShow(stickers: [
            CodableSticker(sticker: Sticker.emptySelection)
        ])
        AddStickerButtonView(collectedStickers: stickers)
    }
}
