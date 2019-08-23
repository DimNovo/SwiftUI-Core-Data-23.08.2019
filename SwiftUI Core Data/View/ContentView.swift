//
//  ContentView.swift
//  SwiftUI Core Data
//
//  Created by Dmitry Novosyolov on 23/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            PersonsModel()
                .navigationBarTitle("Person")
                .navigationBarItems(trailing: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
