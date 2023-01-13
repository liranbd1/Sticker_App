//
//  PhotoPicker.swift
//  Stickers
//
//  Created by Liran on 01/01/2023.
//

import SwiftUI
import PhotosUI

struct PhotoPicker : UIViewControllerRepresentable {
    @ObservedObject var mediaItems: PickedImageItem
    
    typealias UIViewControllerType = PHPickerViewController
    var didFinishPicking : (_ didSelectItem : Bool) -> Void
    
    private func setupConfig() -> PHPickerConfiguration {
        var config = PHPickerConfiguration()
        config.filter = .images
        config.preferredAssetRepresentationMode = .current
        config.selectionLimit = 1
        
        return config
    }
    
    
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        let controller = PHPickerViewController(configuration: setupConfig())
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(photoPicker : self)
    }
    
    class Coordinator : PHPickerViewControllerDelegate {
        var photoPicker : PhotoPicker
        init(photoPicker: PhotoPicker) {
            self.photoPicker = photoPicker
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            photoPicker.didFinishPicking(!results.isEmpty)
            
            guard !results.isEmpty else {
                return
            }
            
            let itemProvider = results[0].itemProvider
            self.getPhoto(from: itemProvider)
        }
        
        private func getPhoto(from itemProvider: NSItemProvider){
            if itemProvider.canLoadObject(ofClass: UIImage.self){
                itemProvider.loadObject(ofClass: UIImage.self) { object, error in
                    if let error = error {
                        print(error.localizedDescription)
                    }
                    
                    if let image = object as? UIImage {
                        DispatchQueue.main.async {
                            self.photoPicker.mediaItems.item = Sticker(image: image)
                        }
                    }
                }
            }
        }
        
    }
}
