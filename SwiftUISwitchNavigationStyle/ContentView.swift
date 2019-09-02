//
//  ContentView.swift
//  SwiftUISwitchNavigationStyle
//
//  Created by bartvk on 30/08/2019.
//  Copyright © 2019 DutchVirtual. All rights reserved.
//

import SwiftUI

struct Person: Identifiable {
    let id: Int
    let name: String
}

let persons: [Person] = [
    Person(id: 0, name: "Gretchen"),
    Person(id: 1, name: "Rowena"),
    Person(id: 2, name: "Jeni"),
    Person(id: 3, name: "Kaye"),
    Person(id: 4, name: "Kenneth")
]

struct PersonDetail: View {
    var person: Person
    var body: some View {
        Text("More info about \(person.name)")
    }
}

struct PersonRow: View, Identifiable {
    var id: Int {
        person.id
    }
    var person: Person
    var body: some View {
        Text("\(person.name)")
    }
}

struct PersonsListView: View {
    var body: some View {
        List(persons) { person in
            NavigationLink(destination: PersonDetail(person: person)) {
                PersonRow(person: person)
            }
        }.navigationBarTitle(Text("Persons"))
    }
}

struct BackupNavigationView: View {
    var body: some View {
        HStack(spacing: 0) {
            NavigationView {
                PersonsListView()
            }.navigationViewStyle(StackNavigationViewStyle())
            Divider()
            Spacer()
            Spacer()
        }
    }
}

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                PersonsListView()
                if geometry.size.width < geometry.size.height {
                    // Portrait
                    BackupNavigationView()
                } else {
                    // Landscape
                    Spacer()
                }
            }.navigationViewStyle(DoubleColumnNavigationViewStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone SE")
            ContentView()
                .previewDevice("iPad Pro (9.7-inch)")
        }
    }
}
