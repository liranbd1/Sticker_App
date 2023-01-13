//
//  ContentView.swift
//  Stickers
//
//  Created by Liran on 30/12/2022.
//

import SwiftUI



struct ContentView: View {
        var body: some View {
            MainPageView(stickers:UtilsFuncs.getAllStickers())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
