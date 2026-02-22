//
//  SignUpView.swift
//  Civis
//
//  Created by Ernesto Cisnero on 2/21/26.
//

import SwiftUI

struct SignUpView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confrimPassword = ""

    var body: some View {

            VStack{
                Text("Create your account")
                    .font(.title2)
                    .fontWeight(.light)
                
                Text("and start practicing")
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundStyle(.gray)
                
                VStack(spacing: 0){
                    FieldInputView(inputType: "Name", inputTypeIco: "name" )
                    FieldInputView(inputType: "Email", inputTypeIco: "email")
                    FieldInputView(inputType: "Password", inputTypeIco: "password")
                    FieldInputView(inputType: "Confirm Password", inputTypeIco: "password" )
                }
                ButtonView(type:"signup", action: {})
            }
            .padding(.top, 30)
            .padding(.horizontal, 20)
        }
}

#Preview {
    SignUpView()
}
