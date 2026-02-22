//
//  FieldInputView.swift
//  Civis
//
//  Created by Ernesto Cisnero on 2/21/26.
//

import SwiftUI


struct FieldInputView: View {
    @State private var userInput: String = ""
    @State private var isSecureTextEntry: Bool = true
    let inputType: String
    let inputTypeIco: String
    
    
    var body: some View {
        HStack {
            
            if let iconImage = iconImage {
                iconImage
                    .foregroundStyle(.gray)
            }
            
            if (inputType == "Password") || (inputType == "Confirm Password"){
                
                if isSecureTextEntry{
                    SecureField("\(inputType)", text: $userInput)
                        .textFieldStyle(.plain)
                }else{
                    TextField("\(inputType)", text: $userInput, )
                        .textFieldStyle(.plain)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                }
                
            }else{
                TextField("\(inputType)", text: $userInput)
                    .textFieldStyle(.plain)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
            }
            
            
            if (inputType == "Password") || (inputType == "Confirm Password") {
                
                Button(action:{
                    isSecureTextEntry.toggle()
                }){
                    if isSecureTextEntry {
                        Image(systemName: "eye.slash")
                            .foregroundStyle(.gray)
                    }else{
                        Image(systemName: "eye")
                            .foregroundStyle(.gray)
                    }
                }
                
            }
                
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 20)
        .background(Color.white)
        .cornerRadius(10)
        .overlay( RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 0.1))
        .padding()
        
    }
    
    private var iconImage: Image? {
        switch inputTypeIco {
        case "name":
            return Image(systemName: "person")
        case "email":
            return Image(systemName: "envelope")
        case "password":
            return Image(systemName: "lock")
        case "google":
            return Image("google")
        default:
            return nil
        }
    }
}

#Preview {
    FieldInputView( inputType: "Password", inputTypeIco: "password" )
}
