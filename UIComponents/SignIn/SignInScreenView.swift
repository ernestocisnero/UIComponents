

import SwiftUI

struct SignInScreenView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            
            LinearGradient(
                colors: [
                    Color.black,
                    Color.indigo.opacity(0.9),
                    Color.blue.opacity(0.8)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            Circle()
                .fill(Color.blue.opacity(0.50))
                .frame(width: 350)
                .blur(radius: 120)
                .offset(x: -140, y: -220)
            
            Circle()
                .fill(Color.purple.opacity(0.3))
                .frame(width: 300)
                .blur(radius: 120)
                .offset(x: 160, y: 260)
            
            VStack(spacing: 36) {
                
                VStack(spacing: 10) {
                    
                    Image(systemName: "lock.shield.fill")
                        .font(.system(size: 40))
                        .foregroundStyle(.white)
                        .padding(18)
                        .background(.white.opacity(0.15))
                        .clipShape(Circle())
                    
                    Text("Secure Login")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundStyle(.white)
                    
                    Text("Access your account")
                        .foregroundStyle(.white)
                }
                
                VStack(spacing: 18) {
                    
                    GlassInputField(
                        title: "Email",
                        placeholder: "email@example.com",
                        text: $email,
                        icon: "envelope"
                    )
                    
                    GlassSecureField(
                        title: "Password",
                        placeholder: "Enter password",
                        text: $password,
                        icon: "lock"
                    )
                }
                
                AnimatedLoginButton(isLoading: $isLoading)
                
                Text("Forgot password?")
                    .font(.footnote)
                    .foregroundStyle(.white)
                
                Spacer()
            }
            .padding(30)
        }
    }
}

#Preview {
    SignInScreenView()
}
