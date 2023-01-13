//
//  StickerSelectionPhotoButton.swift
//  Stickers
//
//  Created by Liran on 01/01/2023.
//

import SwiftUI

struct StickerSelectionPhotoButton: View {
    @State private var isImagePickerDisplay = false
    @ObservedObject var mediaItem = PickedImageItem()
    
    var body: some View {
        Button("Photos") {
            isImagePickerDisplay = true
        }
        .padding()
        .font(.title)
        .background(BackgroundBlurView())
        .cornerRadius(90)
        .scaledToFit()
        .foregroundColor(Color(hex:0xC109C4))
        .sheet(isPresented: self.$isImagePickerDisplay, content: {
            PhotoPicker(mediaItems: mediaItem) { didSelectItem in
                isImagePickerDisplay = false
            }
            
        })
        
    }
}

struct StickerSelectionPhotoButton_Previews: PreviewProvider {
    static var previews: some View {
        StickerSelectionPhotoButton(mediaItem: PickedImageItem())
    }
}
