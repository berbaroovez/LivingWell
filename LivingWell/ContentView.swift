//
//  ContentView.swift
//  LivingWell
//
//  Created by Ephraim Zimmerman on 6/22/24.
//

import SwiftUI
import Charts


//Item(type: .text, content: "Text Cell"),

struct ContentView: View {
    
    
    let items: [Item] = [
        
        
        Item(type: .largecustom, content: "Summary", image_name: "book.pages.fill"),
        Item(type: .image, content: "Sharables and notes", image_name: "book.pages.fill"),
        Item(type: .image, content: "Trusted people", image_name: "person.fill.checkmark"),
        Item(type: .image, content: "History and changes", image_name: "lock.display"),
        Item(type: .custom, content: "Account and preferences", image_name: "hand.wave.fill"),
    ]
    
    let userName = "Ephraim"

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Hello, \(userName)!")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("You have 14 days until account \nconfirmation is neccesary. ")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                    }.padding()
                    Spacer()
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "questionmark.circle.fill") // gearshape
                            .imageScale(.large)
                            .foregroundColor(.brown)
                            .fontWeight(.bold) // Make the image bold
                    }
                }
                .padding()
                
                List {
                    
                    ForEach(items) { item in
                        NavigationLink(destination: self.destinationView(for: item)) {
                            RowView(item: item)
                        }
                    }
                    
                    // Footer with copyright text
                    Section(footer: FooterView()) {
                        EmptyView()
                    }
                }
            }/*navigationTitle("Home")*/
        }.accentColor(.brown)
    }
    @ViewBuilder
        private func destinationView(for item: Item) -> some View {
            switch item.type {
            case .text:
                TextDetailView(item: item)
            case .image:
                ImageDetailView(item: item)
            case .custom:
                SettingsPageView(item: item)
            case .largecustom:
                TextDetailView(item: item)
            }
        }
    }


struct SummaryView: View {
    var body: some View {
        Text("© 2024 EJZ & Company, LLC")
            .font(.title)
            .foregroundColor(.gray)
//            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
    }
}



struct FooterView: View {
    var body: some View {
        Text("© 2024 EJZ & Company, LLC")
            .font(.footnote)
            .foregroundColor(.gray)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
    }
}



struct TextDetailView: View {
    let item: Item

    var body: some View {
        VStack {
            Text("Text Detail View")
                .font(.largeTitle)
                .padding()
            Text("You selected: \(item.content)")
                .font(.headline)
                .padding()
            Spacer()
        }
        .navigationTitle(item.content)
    }
}

struct ImageDetailView: View {
    let item: Item

    let items: [Item] = [
        
        Item(type: .image, content: "Sharables and notes", image_name : "book.pages.fill"),
        Item(type: .image, content: "Trusted people", image_name: "person.fill.checkmark"),
        Item(type: .image, content: "Notifications and alerts", image_name: "hand.wave.fill"),
        Item(type: .custom, content: "Account and preferences", image_name: "hand.wave.fill"),



    ]
    let trustedPeople = ["Ephraim Zimmerman", ]

    var body: some View {
        NavigationView {
              List(1..<13) { item in
                 NavigationLink(destination: Text("\(item) x 8 = \(item*8)")) {
                      Text(String(item))
                    }
              }.navigationBarTitle("Table of 8")
           }.accentColor(.orange) // <- note that it's added here and not on the List like navigationBarTitle()
    }
    @ViewBuilder
        private func destinationView(for item: Item) -> some View {
            switch item.type {
            case .text:
                TextDetailView(item: item)
            case .image:
                ImageDetailView(item: item)
            case .custom:
                CustomDetailView(item: item)
            case .largecustom:
                LargeCustomDetailView(item: item)
            }
        }
}


struct DetailView: View {
    let item: Item

    var body: some View {
        VStack {
            Text("Detail View")
                .font(.largeTitle)
                .padding()
            Text("You selected: \(item)")
                .font(.headline)
                .padding()
            Spacer()
        }
        .navigationTitle(item.content)
    }
}


struct LargeCustomDetailView: View {
    let item: Item

    var body: some View {
        VStack {
            Text("Custom Detail View")
                .font(.largeTitle)
                .padding()
            Text("This is a completely different UI for: \(item.content)")
                .font(.headline)
                .padding()
            // Add your custom UI components here
            Spacer()
        }
        .navigationTitle(item.content)
    }
}



struct CustomDetailView: View {
    let item: Item
    

    var body: some View {
        VStack {
            Text("Custom Detail View")
                .font(.largeTitle)
                .padding()
            Text("This is a completely different UI for: \(item.content)")
                .font(.headline)
                .padding()
            // Add your custom UI components here
            Spacer()
        }
        .navigationTitle(item.content)
    }
}


struct RowView: View {
    let item: Item

    var body: some View {
        HStack {
            switch item.type {
            case .text:
                TextCell(content: item.content)
            case .image:
                ImageCell(content: item.content, image_name: item.image_name)
            case .custom:
                CustomCell(content: item.content, image_name: item.image_name)
            case .largecustom:
                LargeCustomCell(content: item.content, image_name: item.image_name)
            }

            Spacer()
        }
    }
}

struct ToyShape: Identifiable {
    var type: String
    var count: Double
    var id = UUID()
}

struct LargeCustomCell: View {
    let content: String
    let image_name: String

    
    var data: [ToyShape] = [
        .init(type: "Cube", count: 5),
        .init(type: "Sphere", count: 4),
        .init(type: "Pyramid", count: 4)
    ]
    
    var body: some View {
        
        HStack {
            Image(systemName: "gearshape")
            Text(content)
                .font(.headline)
            Spacer()
        }
        .padding()
    }
}

struct CustomCell: View {
    let content: String
    let image_name: String

    
    var body: some View {
        HStack {
            Image(systemName: "gearshape")
            Text(content)
                .font(.headline)
            Spacer()
        }
        .padding()
    }
}

struct Item: Identifiable {
    enum ItemType {
        case text
        case image
        case custom
        case largecustom
    }
    
    let id = UUID()
    let type: ItemType
    let content: String
    let image_name: String
}


struct TextCell: View {
    let content: String
    
    var body: some View {
        HStack {
            Text(content)
            Spacer()
        }
        .padding()
    }
}

struct ImageCell: View {
    
    let content: String
    let image_name: String

    
    var body: some View {
        HStack {
            Image(systemName: image_name)
                .imageScale(.medium)
                .foregroundColor(.brown)
        
            Text(content)
            Spacer()
        }
        .padding()
    }
}




struct SettingsView: View {
    var body: some View {
        VStack {
            Text("Settings")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    ContentView()
}
