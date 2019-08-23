//
//  ImagePicker.swift
//  SwiftUI Core Data
//
//  Created by Dmitry Novosyolov on 23/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @Binding var showImagePicker: Bool
    @Binding var image: UIImage?
    
    init(showImagePicker: Binding<Bool>, image: Binding<UIImage?>) {
        _showImagePicker = showImagePicker
        _image = image
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        image = uiImage
        showImagePicker = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        showImagePicker = false
    }
}


struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var showImagePicker: Bool
    @Binding var image: UIImage?
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {}
    
    func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator(showImagePicker: $showImagePicker, image: $image)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
}
