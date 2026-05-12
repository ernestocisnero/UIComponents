//
//  GlassInputField.swift
//  UIComponents
//
//  Created by Ernesto Cisnero on 3/8/26.
//

import SwiftUI

struct GlassInputField: View {
    
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
                
                TextField(placeholder, text: $text)
                    .foregroundStyle(.white)
                    .textInputAutocapitalization(.never)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(.white.opacity(0.12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(.white, lineWidth: 1)
                    )
            )
        }
    }
}

#Preview {
    GlassInputField(title: "Email",
                    placeholder: "email@example.com",
                    text: .constant(""),
                    icon: "envelope")
}
