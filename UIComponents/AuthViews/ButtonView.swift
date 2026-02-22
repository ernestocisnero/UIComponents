//
//  ButtonView.swift
//  Civis
//
//  Created by Ernesto Cisnero on 2/21/26.
//

import SwiftUI

struct ButtonView: View {
    let type: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            if type == "google"{
                HStack{
                    Image("googleico")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    Text("Google")
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Color.white)
                .cornerRadius(10)
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .foregroundColor(.black)
                .fontWeight(.light)
            }else{
                HStack{
                    
                    Text(type == "signin" ? "Sign In" : "Sign Up")
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Color.black)
                .cornerRadius(10)
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
            }
            
        }
        .padding(.horizontal, 16)
    }
    
   
}

#Preview {
    ButtonView(type: "google", action: {})
}
