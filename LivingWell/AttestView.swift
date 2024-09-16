//
//  AttestView.swift
//  LivingWell
//
//  Created by Ephraim Zimmerman on 8/7/24.
//

import SwiftUI

struct AttestView: View {
    
        @State private var isPressing = false
       @State private var secondsPressed = 0
       @State private var timer: Timer?


    var body: some View {
        
        ZStack {
            Color.orange.ignoresSafeArea()
            
            VStack {
                
                Text(isPressing ? "Pressed for \(secondsPressed) seconds" : "Press and hold")
                    .padding()
                    .background(isPressing ? Color.red : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1.0, pressing: { isPressing in
                        self.isPressing = isPressing
                        if isPressing {
                            print("pressing")
                        } else {
                            print("not pressing")
                        }
                    }) {
                        print("Long press completed")
                    }
                
                
                
            }
        }
            //                Text("Hold down on the screen for 5 seconds to complete your attestation.")
            ////                    .frame(width: 200)
            //                    .fontWeight(.medium)
            //                    .font(.title)
            //                    .padding(.all, 30)
            //                    .padding(.bottom, 50)
            //
            //
            //            }
            //
            
            //            Text("You have 14 days until account \nconfirmation is neccesary. ")
            //                .font(.subheadline)
            //                .foregroundColor(.gray)
            
            
            
        }
        
        
        
    
}
    






#Preview {
    AttestView()
}
