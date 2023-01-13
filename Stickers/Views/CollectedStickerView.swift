//
//  CollectedStickerView.swift
//  Stickers
//
//  Created by Liran on 13/01/2023.
//

import SwiftUI

struct CollectedStickerView: View {
    @ObservedObject var sticker : CodableSticker
    var body: some View {
        HStack{
            VStack{
                Image(uiImage:sticker.getImage())
                    .resizable()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                Text(sticker.emoji)
            }
            Text(sticker.getDate())
                .foregroundColor(Color(hex: 0xD848F3))
                .background(Color(hex: 0xF8D1EE)
                    .opacity(0.6)
                )
                .cornerRadius(90)
                
        }.frame(width: 350, height: 200)
    }
}

struct CollectedStickerView_Previews: PreviewProvider {
    static var previews: some View {
        CollectedStickerView(sticker: CodableSticker(sticker: Sticker.emptySelection))
    }
}
