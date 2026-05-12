//
//  GlassCardDemo.swift
//  UIComponents
//
//  Created by Ernesto Cisnero on 3/8/26.
//

import SwiftUI

struct GlassCardDemo: View {
    
    var title: String
    var subtitle: String
    var icon: String
    
    var body: some View {
            ZStack {
                
                LinearGradient(
                    colors: [.purple, .blue],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 24)
                        .fill(.ultraThinMaterial)
                        .background(
                            RoundedRectangle(cornerRadius: 24)
                                .fill(
                                    LinearGradient(
                                        colors: [
                                            Color.white.opacity(0.25),
                                            Color.white.opacity(0.05)
                                        ],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(Color.white.opacity(0.3), lineWidth: 1)
                        )
                        .shadow(color: Color.black.opacity(0.25), radius: 20, x: 0, y: 10)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Image(systemName: icon)
                            .font(.system(size: 28))
                            .foregroundStyle(.white)
                            
                            Text(title)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            Text(subtitle)
                                .font(.subheadline)
                                .foregroundStyle(.white.opacity(0.8))
                        }
                        .padding(24)
                    }
                    .frame(width: 260, height: 160)
            }
        }
}

#Preview {
    GlassCardDemo(title: "Daily Progress", subtitle: "12 Questions Completed", icon: "sparkles")
}
