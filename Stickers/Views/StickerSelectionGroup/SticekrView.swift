//
//  SticekrView.swift
//  Stickers
//
//  Created by Liran on 01/01/2023.
//

import SwiftUI

struct SticekrView: View {
   
    @ObservedObject var mediaItem = PickedImageItem()

    var body: some View {
        
        if mediaItem.item.image == nil {
            Image(systemName: "snow")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width: 300, height: 300)
                .foregroundColor(Color(hex:0xC109C4))
        } else {
            Image(uiImage: mediaItem.item.image ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width: 300, height: 300)
        }
    }
}

struct SticekrView_Previews: PreviewProvider {
    static var previews: some View {
        SticekrView()
    }
}
