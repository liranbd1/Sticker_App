//
//  BackgroundView.swift
//  Stickers
//
//  Created by Liran on 30/12/2022.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Image("butterfly")
            .resizable()
            .scaledToFill()
            .rotationEffect(Angle(degrees: 180))
            .ignoresSafeArea()
            
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
