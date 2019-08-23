//
//  AddNewPerson.swift
//  SwiftUI Core Data
//
//  Created by Dmitry Novosyolov on 23/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct AddNewPerson: View {
    
    @State private var addImage = false
    @Binding var image: UIImage?
    @Binding var selectedSegment: Int
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var age: String
    @Binding var isFavorite: Bool
    
    var body: some View {
        VStack {
            Image(uiImage: image ?? UIImage(systemName: "plus.circle")!)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .padding()
                .shadow(color: .secondary, radius: 7)
                .onTapGesture { self.addImage.toggle()}
            VStack {
                TextField("First Name", text: self.$firstName) {}
                TextField("Last Name", text: self.$lastName) {}
                TextField("Age", text: self.$age) {}
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Picker(selection: $selectedSegment, label: Text("")) {
                Text("male")
                Text("female")
            }
            .padding()
            .shadow(color: .secondary, radius: 3)
            .pickerStyle(SegmentedPickerStyle())
            
            Image(systemName: isFavorite ? "star.fill" : "star")
                .resizable()
            .frame(width: 50, height: 50)
                .foregroundColor(.yellow)
                .shadow(color: isFavorite ? .primary : .secondary, radius: 3)
                .onTapGesture { self.isFavorite.toggle()}
            
            Spacer()
        }
        .sheet(isPresented: self.$addImage)
        { ImagePicker(showImagePicker: self.$addImage, image: self.$image)}
        .padding()
    }
}

struct AddNewPerson_Previews: PreviewProvider {
    static var previews: some View {
        AddNewPerson(image: .constant(UIImage(systemName: "plus.circle")),
                     selectedSegment: .constant(0),
                     firstName: .constant("bob"),
                     lastName: .constant("rob"),
                     age: .constant("..."),
                     isFavorite: .constant(true))
    }
}
