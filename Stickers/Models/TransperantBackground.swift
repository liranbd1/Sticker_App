//
//  TransperantBackground.swift
//  Stickers
//
//  Created by Liran on 31/12/2022.
//

import SwiftUI

struct BackgroundBlurView : UIViewRepresentable{
    func makeUIView(context: Context) ->  UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}
