//
//  SettingsView.swift
//  LivingWell
//
//  Created by Ephraim Zimmerman on 8/7/24.
//

import SwiftUI

struct SettingsPageView: View {
    
     let item: Item

       @State private var appNotificationsEnabled = true
       @State private var emailNotificationsEnabled = true
       @State private var textNotificationsEnabled = true
       @State private var volumeLevel: Double = 50
       @State private var selectedTheme = "Light"
       @State private var availableThemes = ["Month", "Three Months", "Six Months", "Twelve Months"]

    var body: some View {
            NavigationView {
                Form {
                    Section(header: Text("Notifications")) {
                        VStack(alignment: .leading) {
                            Text("Receivables")
                                .font(.headline)
                            Text("You may toggle notification preferences below. Note that at least two notification types are required. ")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .padding(.bottom, 5)
                            
                            Toggle(isOn: $appNotificationsEnabled) {
                                Text("App Push Notifications")
                                
                            }
                            
                            Toggle(isOn: $emailNotificationsEnabled) {
                                Text("Email Notifications")
                                
                            }
                            
                            Toggle(isOn: $textNotificationsEnabled) {
                                Text("Text Notifications")
                                
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Frequency")
                                .font(.headline)
                            Text("Choose the frequency in which LivingWell will contact you. We recommend notifications be sent monthly (this also reminds you to update your accounts if necessary).")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .padding(.bottom, 5)
                            
                            Picker("Choose", selection: $selectedTheme) {
                                ForEach(availableThemes, id: \.self) {
                                    Text($0)
                                }
                            }
                        }
                    }
                    
                    Section(header: Text("Subscription")) {
                        VStack(alignment: .leading) {
//                            Text("Volume")
//                                .font(.headline)
                            Text("Subscriptions are managed through Apple and are only available for purchase on an annual basis. For more information, please view Apple.com/subscriptions")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .padding(.bottom, 5)
                            
//                            HStack {
//                                Text("Volume")
//                                Slider(value: $volumeLevel, in: 0...100)
//                            }
                        }
                    }
                }
//                .navigationTitle("Settings")
            }
        }
    }

//#Preview {
//    SettingsPageView(item: Item)
//}
