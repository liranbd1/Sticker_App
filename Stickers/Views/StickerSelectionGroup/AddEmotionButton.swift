//
//  AddEmotionButton.swift
//  Stickers
//
//  Created by Liran on 08/01/2023.
//

import SwiftUI

enum DemoError : Error {
    case Me
}

struct AddEmotionButton: View {
    @State var isNewStickerAdded = false
    @ObservedObject var mediaItem : PickedImageItem
    @ObservedObject var CollectedStickers : StickersToShow
    @State var showAlert = false
    @State var alertMsg : String?
    
    var body: some View {
        Button(" Add emotion"){
            let sticker = CodableSticker(sticker: mediaItem.item)
            do {
                let encoder = JSONEncoder()
                let data = try encoder.encode(sticker)
                
                UserDefaults.standard.set(data, forKey: "\(sticker.getDate())_sticker")
                
                alertMsg = "Sticker was added :)"
                CollectedStickers.stickers.append(sticker)
                showAlert.toggle()
            }
            catch{
                alertMsg = "Sticker was not added :("
                showAlert.toggle()
            }
        }
        .opacity(mediaItem.isItemReady() ? 1: 0.3)
        .disabled(!mediaItem.isItemReady())
        .background(BackgroundBlurView())
        .cornerRadius(90)
        .scaledToFill()
        .font(.largeTitle)
        .foregroundColor(Color(hex:0xC109C4))
        .alert(alertMsg ?? "", isPresented: $showAlert){
            Button("OK", role:.cancel){
                showAlert.toggle()
                mediaItem.clear()
            }
        }
    }
}

struct AddEmotionButton_Previews: PreviewProvider {
    static var previews: some View {
        var stickers = StickersToShow(stickers: [
            CodableSticker(sticker: Sticker.emptySelection)
        ])
        AddEmotionButton(mediaItem:PickedImageItem(), CollectedStickers: stickers)
    }
}
