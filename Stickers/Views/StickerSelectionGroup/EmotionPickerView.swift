//
//  EmotionPickerView.swift
//  Stickers
//
//  Created by Liran on 01/01/2023.
//

import SwiftUI

struct EmotionPickerView: View {
    let OptionsArray =
    [
        "Happy":  "😁",
        "Sad": "😢",
        "Tired": "😴",
        "Angry": "😡",
        "Excited": "🤩"
    ]
    

    @ObservedObject var mediaItem : PickedImageItem
    var body: some View {
        Picker("How you feel?", selection: $mediaItem.item.emoji){
            ForEach(OptionsArray.sorted(by: >), id: \.key) { key, value in
                Text("\(key) \(value)").tag(value)
            }
        }
        .pickerStyle(.menu)
        .background(BackgroundBlurView())
        .cornerRadius(60)
        .tint(Color(hex:0xC109C4))
    }
}

struct EmotionPickerView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionPickerView(mediaItem: PickedImageItem())
    }
}
