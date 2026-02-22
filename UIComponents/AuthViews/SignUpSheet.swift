//
//  SignUpSheetView.swift
//  Civis
//
//  Created by Ernesto Cisnero on 2/22/26.
//

import SwiftUI

struct SignUpSheet: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                SignUpView()
            }
            .padding(24)
        }
        .presentationDetents([.large])
        .presentationDragIndicator(.visible)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .presentationBackground(.white)
    }
}

#Preview {
    SignUpSheet()
}
