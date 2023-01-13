//
//  StickerSelectionView.swift
//  Stickers
//
//  Created by Liran on 30/12/2022.
//

import SwiftUI
import Foundation
import PhotosUI

struct StickerSelectionView: View {
    
    @ObservedObject var mediaItem = PickedImageItem()
    @State var isNewStickerAdded = false
    @State var isStickerReady = false
    @ObservedObject var collectedSticker : StickersToShow
    var body: some View {
        VStack {
            NavigationView {
                ZStack{
                    BackgroundView()
                    VStack {
                        SticekrView(mediaItem: mediaItem)
                        
                        HStack{
                            StickerSelectionPhotoButton(mediaItem: mediaItem)
                        }
                        
                        EmotionPickerView(mediaItem: mediaItem)
                        Divider()
                        AddEmotionButton(mediaItem: mediaItem, CollectedStickers: collectedSticker)
                    }
                    
                }
            }
        }
    }
}

struct StickerSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        var stickers = StickersToShow(stickers: [
            CodableSticker(sticker: Sticker.emptySelection)
        ])
        StickerSelectionView(collectedSticker: stickers)
    }
}
