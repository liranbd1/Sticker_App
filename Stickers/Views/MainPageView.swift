//
//  MainPageView.swift
//  Stickers
//
//  Created by Liran on 30/12/2022.
//

import SwiftUI



struct MainPageView: View {
    @ObservedObject var stickers : StickersToShow
    @State var addedNewImage = false
    var body: some View {
        NavigationView{
            ZStack{
                BackgroundView()
                VStack{
                    AddStickerButtonView(collectedStickers: stickers)
                    NavigationLink("My Stickers"){
                        CollectedStickers(allStickers:stickers)
                    }.buttonStyle(PlainButtonStyle())
                        .frame(width: 200)
                        .background(Color(hex: 0xF8D1EE).opacity(0.6))
                        .foregroundColor(Color(hex: 0xC109C4))
                        .cornerRadius(90)
                        .multilineTextAlignment(.center)
                        .font(.title)
                }
            }
        }
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        let stickers = StickersToShow(stickers: [
            CodableSticker(sticker: Sticker.emptySelection)
        ])
        MainPageView(stickers: stickers)
    }
}
