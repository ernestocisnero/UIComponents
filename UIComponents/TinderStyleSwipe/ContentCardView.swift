//
//  ContentCardView.swift
//  UIComponents
//
//  Created by Ernesto Cisnero on 5/11/26.
//

import SwiftUI

struct ContentCardView: View {
    
    @State var user: UserList?
    
    var body: some View {
        
        ZStack{
            ForEach(users){ user in
                CardView(viewdata: user)
            }
        }
        
    }
}

#Preview {
    ContentCardView()
}
 
