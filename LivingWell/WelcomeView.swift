//
//  LoginView.swift
//  LivingWell
//
//  Created by Ephraim Zimmerman on 8/7/24.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        
        
        VStack(alignment: .leading) {
            Text("Hello, !")
                .font(.title)
                .fontWeight(.bold)
            Text("You have 14 days until account \nconfirmation is neccesary. ")
                .font(.subheadline)
                .foregroundColor(.gray)
            
        }.padding()
//        
//        Image("lemon")
//            .resizable()
//            .frame(width: 320.0, height: 500.0)
        
        
//        @State var gradientStyle = Gradient(colors: [
//            .blue, .purple, .red, .orange, .yellow
//        ])
//        
//        AngularGradient(gradient: /*@START_MENU_TOKEN@*/Gradient(colors: [Color.red, Color.blue])/*@END_MENU_TOKEN@*/, center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
    }
}

#Preview {
    LoginView()
}
