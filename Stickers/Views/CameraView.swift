//
//  CameraView.swift
//  Stickers
//
//  Created by Liran on 31/12/2022.
//

import SwiftUI

struct CameraView: View {
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    
    var body: some View {
        NavigationView {
            
            VStack {
                if selectedImage != nil {
                    Image(uiImage: selectedImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: 200, height: 200)
                } else {
                    Image(systemName: "snow")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(width: 200, height: 200)
                }
                HStack{
                    Button("Camera") {
                        self.sourceType = .camera
                        self.isImagePickerDisplay.toggle()
                    }
                    .padding()
                    .font(.title)
                    .foregroundColor(Color(hex:0xC109C4))
                    
                    Button("photo") {
                        self.sourceType = .photoLibrary
                        self.isImagePickerDisplay.toggle()
                    }
                    .padding()
                    .font(.title)
                    .foregroundColor(Color(hex:0xC109C4))
                    
                    
                }.scaledToFit()
                
            }
            .sheet(isPresented: self.$isImagePickerDisplay) {
                ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
            }
            
        }
        
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
