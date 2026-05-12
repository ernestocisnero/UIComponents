//
//  UserProgressBar.swift
//  UIComponents
//
//  Created by Ernesto Cisnero on 3/15/26.
//

import SwiftUI

// MARK: - UserProgressBar Component

struct UserProgressBar: View {
    
    // MARK: - Properties
    
    /// Progress value from 0.0 to 1.0 (represents 0% to 100%)
    var progress: Double
    
    /// Height of the progress bar track
    var trackHeight: CGFloat = 12
    
    /// Whether to show the percentage label
    var showLabel: Bool = true
    
    // Clamps progress between 0 and 1
    private var clampedProgress: Double {
        min(max(progress, 0), 1)
    }
    
    private var percentageText: String {
        "\(Int(clampedProgress * 100))%"
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if showLabel {
                labelRow
            }
            trackView
        }
    }
    
    // MARK: - Subviews
    
    private var labelRow: some View {
        HStack {
            Text("Progress")
                .font(.system(size: 13, weight: .medium, design: .default))
                .foregroundColor(.black)
            Spacer()
            Text(percentageText)
                .font(.system(size: 13, weight: .semibold, design: .monospaced))
                .foregroundColor(.black)
        }
    }
    
    private var trackView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                
                // Track background
                RoundedRectangle(cornerRadius: trackHeight / 2)
                    .fill(Color.black.opacity(0.08))
                    .frame(height: trackHeight)
                    .overlay(
                        RoundedRectangle(cornerRadius: trackHeight / 2)
                            .strokeBorder(Color.black.opacity(0.15), lineWidth: 1)
                    )
                
                // Filled progress
                RoundedRectangle(cornerRadius: trackHeight / 2)
                    .fill(Color.black)
                    .frame(
                        width: max(0, geometry.size.width * clampedProgress),
                        height: trackHeight
                    )
                    .animation(.spring(response: 0.5, dampingFraction: 0.8), value: clampedProgress)
                
                // Leading cap dot — only visible when progress > 0
                if clampedProgress > 0 {
                    Circle()
                        .fill(Color.white)
                        .frame(width: trackHeight - 4, height: trackHeight - 4)
                        .offset(x: max(0, geometry.size.width * clampedProgress) - (trackHeight / 2))
                        .animation(.spring(response: 0.5, dampingFraction: 0.8), value: clampedProgress)
                }
            }
        }
        .frame(height: trackHeight)
    }
}

// MARK: - Preview

#Preview("UserProgressBar") {
    UserProgressBarPreview()
}

private struct UserProgressBarPreview: View {
    
    @State private var progress: Double = 0.65
    
    var body: some View {
        ScrollView {
            VStack(spacing: 36) {
                
                // Header
                VStack(spacing: 4) {
                    Text("UserProgressBar")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.black)
                    Text("SwiftUI Component")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.black.opacity(0.4))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                
                // Interactive demo
                VStack(alignment: .leading, spacing: 16) {
                    Text("Interactive")
                        .font(.system(size: 11, weight: .semibold))
                        .foregroundColor(.black.opacity(0.4))
                        .textCase(.uppercase)
                        .kerning(1)
                    
                    UserProgressBar(progress: progress)
                    
                    Slider(value: $progress, in: 0...1)
                        .tint(.black)
                }
                .padding(20)
                .background(Color.white)
                .cornerRadius(14)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .strokeBorder(Color.black.opacity(0.08), lineWidth: 1)
                )
                
                // Static states
                VStack(alignment: .leading, spacing: 16) {
                    Text("Static States")
                        .font(.system(size: 11, weight: .semibold))
                        .foregroundColor(.black.opacity(0.4))
                        .textCase(.uppercase)
                        .kerning(1)
                    
                    ForEach([0.0, 0.25, 0.5, 0.75, 1.0], id: \.self) { value in
                        UserProgressBar(progress: value)
                    }
                }
                .padding(20)
                .background(Color.white)
                .cornerRadius(14)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .strokeBorder(Color.black.opacity(0.08), lineWidth: 1)
                )
                
                // Variants
                VStack(alignment: .leading, spacing: 20) {
                    Text("Size Variants")
                        .font(.system(size: 11, weight: .semibold))
                        .foregroundColor(.black.opacity(0.4))
                        .textCase(.uppercase)
                        .kerning(1)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Small (6pt)").font(.caption).foregroundColor(.black.opacity(0.5))
                        UserProgressBar(progress: 0.7, trackHeight: 6, showLabel: false)
                    }
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Default (12pt)").font(.caption).foregroundColor(.black.opacity(0.5))
                        UserProgressBar(progress: 0.7)
                    }
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Large (20pt)").font(.caption).foregroundColor(.black.opacity(0.5))
                        UserProgressBar(progress: 0.7, trackHeight: 20, showLabel: false)
                    }
                }
                .padding(20)
                .background(Color.white)
                .cornerRadius(14)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .strokeBorder(Color.black.opacity(0.08), lineWidth: 1)
                )
            }
            .padding(24)
        }
        .background(Color(white: 0.96))
    }
}
