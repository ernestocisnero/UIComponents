//
//  SignInView.swift
//  Civis
//
//  Created by Ernesto Cisnero on 2/21/26.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {

            VStack{
                
                VStack(spacing: 0){
                   FieldInputView(inputType: "Email", inputTypeIco: "email" )
                   FieldInputView(inputType: "Password", inputTypeIco: "password")
                }
                
                HStack{
                    Spacer()
                    Button("Forgot Password?") {
                        //Handle forgot password
                    }
                    .font(.system(size: 14, weight: .light))
                    .padding(.horizontal,16)
                    .padding(.vertical, 6)
                }
                
                ButtonView(type:"signin", action: {})
            }
            
        }
        
    }

#Preview {
    SignInView()
}
