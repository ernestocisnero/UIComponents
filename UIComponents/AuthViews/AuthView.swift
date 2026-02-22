//
//  AuthView.swift
//  Civis
//
//  Created by Ernesto Cisnero on 2/21/26.
//

import SwiftUI

struct AuthView: View {
    @State private var showSignUp: Bool = false
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    
                    // MARK: - Header
                    Image("studyPerson")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                    
                    VStack(spacing: 4) {
                        Text("Welcome to Civis")
                            .font(.title2)
                            .fontWeight(.light)
                        
                        Text("Sign In and start practicing")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    
                    // MARK: - Sign In Form
                    SignInView()
                    
                    // MARK: - Divider
                    HStack(spacing: 12) {
                        Rectangle()
                            .fill(Color.secondary.opacity(0.3))
                            .frame(height: 1)
                        
                        Text("Or continue with")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                            .fixedSize()
                        
                        Rectangle()
                            .fill(Color.secondary.opacity(0.3))
                            .frame(height: 1)
                    }
                    
                    // MARK: - Providers
                    ButtonView(type: "google", action: {})
                    
                    // MARK: - Bottom CTA
                    HStack(spacing: 4) {
                        Text("Don't have an account?")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                        
                        Button("Sign up") {
                            showSignUp.toggle()
                        }
                        .font(.subheadline)
                    }
                    .padding(.top, 8)
                }
                .padding(24)
            }
        }
        .sheet(isPresented: $showSignUp) {
            SignUpSheet()
        }
    }
}

#Preview {
    AuthView()
}
