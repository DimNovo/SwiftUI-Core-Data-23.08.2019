//
//  PersonsModel.swift
//  SwiftUI Core Data
//
//  Created by Dmitry Novosyolov on 23/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct PersonsModel: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Person.fetchRequest()) var persons: FetchedResults<Person>
    
    @State private var addImage = false
    @State private var addPerson = false
    @State private var image: UIImage?
    @State private var isFavorite = false
    @State private var selectedSegment = 0
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var age = ""
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 25) {
                Text("Add New Person")
                    .font(.headline)
                Button(action: { self.addPerson.toggle()}) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.green)
                        .imageScale(.large)
                }
            }
            List {
                ForEach(persons, id: \.id) { person in
                    PersonCellModel(
                        image: Image(uiImage: UIImage(data: person.photoData!) ?? UIImage(systemName: "plus.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 100, weight: .regular))!),
                        favImage: Image(systemName: person.isFavorite ? "star.fill" : "star"),
                        gender: person.gender ?? "...",
                        firstName: person.firstName ?? "...",
                        lastName: person.lastName ?? "...",
                        age: person.age ?? "...")
                }.onDelete { IndexSet in
                    guard 0 < self.persons.count else { return }
                    self.managedObjectContext.delete(self.persons[IndexSet.first!])
                    do { try self.managedObjectContext.save()}
                    catch { print(error, error.localizedDescription)}
                }
            }
        }
        .sheet(isPresented: self.$addPerson, onDismiss: {
            
            guard !self.firstName.isEmpty, !self.lastName.isEmpty, !self.age.isEmpty else { return }
            
            let personMOC = Person(context: self.managedObjectContext)
            
            personMOC.firstName = self.firstName
            personMOC.lastName = self.lastName
            personMOC.age = self.age
            
            if self.selectedSegment == 0
            { personMOC.gender = "male" }
            else
            { personMOC.gender = "female" }
            
            personMOC.isFavorite = self.isFavorite
            personMOC.photoData = self.image?.pngData()
            
            do { try self.managedObjectContext.save()}
            catch { print(error, error.localizedDescription)}
            
            self.isFavorite = false
            self.firstName = ""
            self.lastName = ""
            self.age = ""
            self.image = UIImage(systemName: "plus.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 100, weight: .regular))
            
        }) { AddNewPerson(image: self.$image,
                          selectedSegment: self.$selectedSegment,
                          firstName: self.$firstName,
                          lastName: self.$lastName,
                          age: self.$age,
                          isFavorite: self.$isFavorite)}
    }
}

struct PersonsModel_Previews: PreviewProvider {
    static var previews: some View {
        PersonsModel()
    }
}
