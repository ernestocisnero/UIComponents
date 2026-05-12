//
//  GlassSecureField.swift
//  UIComponents
//
//  Created by Ernesto Cisnero on 3/8/26.
//

import SwiftUI

struct GlassSecureField: View {
    
    var title: String
    var placeholder: String
    @Binding var text: String
    var icon: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            
            Text(title)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.7))
            
            HStack {
                
                Image(systemName: icon)
                    .foregroundStyle(.white.opacity(0.8))
                
                SecureField(placeholder, text: $text)
                    .foregroundStyle(.white)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(.white.opacity(0.12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(.white.opacity(0.25), lineWidth: 1)
                    )
            )
        }
    }
}

#Preview {
    GlassSecureField(title: "Password",
                     placeholder: "Enter password",
                     text: .constant(""),
                     icon: "lock")
}
