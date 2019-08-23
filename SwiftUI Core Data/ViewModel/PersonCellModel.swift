//
//  PersonCellModel.swift
//  SwiftUI Core Data
//
//  Created by Dmitry Novosyolov on 23/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct PersonCellModel: View {
    
    var image: Image
    var favImage: Image
    var gender = ""
    var firstName = ""
    var lastName = ""
    var age = ""
    
    
    var body: some View {
        HStack {
            ZStack {
                image
                    .resizable()
                    .frame(width: 110, height: 110)
                    .clipShape(Circle())
                    .shadow(color: .secondary, radius: 7)
                    .padding(.all, 10)
                favImage
                    .resizable()
                    .frame(width: 22, height: 22)
                    .offset(x: 45, y: 45)
                    .foregroundColor(.yellow)
                    .shadow(color: .white, radius: 3)
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text("first name:")
                        .font(.callout)
                        .foregroundColor(.secondary)
                    Text(firstName)
                        .underline(color: .red)
                }
                HStack {
                    Text("last name:")
                        .font(.callout)
                        .foregroundColor(.secondary)
                    Text(lastName)
                        .underline(color: .red)
                }
                HStack {
                    Text("age:")
                        .font(.callout)
                        .foregroundColor(.secondary)
                    Text(age)
                }
                HStack {
                    Text("gender:")
                        .font(.callout)
                        .foregroundColor(.secondary)
                    Text(gender)
                }
            }
            .padding(.horizontal, 25)
            .foregroundColor(.primary)
            .font(.custom("American typewriter", size: 18))
        }
    }
}

struct PersonCellModel_Previews: PreviewProvider {
    static var previews: some View {
        PersonCellModel(
            image: Image(uiImage: UIImage(systemName: "plus.circle")!),
            favImage: Image(systemName: "star")
        )
    }
}
