//
//  AnimatedLoginButton.swift
//  UIComponents
//
//  Created by Ernesto Cisnero on 3/8/26.
//

import SwiftUI

struct AnimatedLoginButton: View {
    
    @Binding var isLoading: Bool
    
    var body: some View {
        Button {
            
            withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                isLoading = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.spring()) {
                    isLoading = false
                }
            }
            
        } label: {
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        LinearGradient(
                            colors: [.purple, .blue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .shadow(color: .blue.opacity(0.6), radius: 12, y: 6)
                
                if isLoading {
                    
                    ProgressView()
                        .tint(.white)
                    
                } else {
                    
                    HStack(spacing: 10) {
                        
                        Text("Sign In")
                            .fontWeight(.semibold)
                        
                        Image(systemName: "arrow.right")
                    }
                    .foregroundStyle(.white)
                }
            }
            .frame(height: 56)
            .scaleEffect(isLoading ? 0.95 : 1)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    AnimatedLoginButton(isLoading: .constant(false))
}
