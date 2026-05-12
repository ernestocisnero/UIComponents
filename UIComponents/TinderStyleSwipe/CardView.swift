//
//  CardView.swift
//  UIComponents
//
//  Created by Ernesto Cisnero on 5/11/26.
//

import SwiftUI

struct CardView: View {
    @State private var offset = CGSize.zero
    @State private var color: Color = .black
    @State var viewdata: UserList
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 325, height: 425)
                .border(.white, width: 6.0)
                .cornerRadius(4)
                .foregroundStyle(color)
                .shadow(radius: 4)
            
            Image(systemName: "\(viewdata.photo)")
                .resizable()
                .frame(width: 200, height: 200)
                .foregroundStyle(Color.white)
        }
        .offset(x: offset.width * 1, y: offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width/40)))
        .gesture(
            DragGesture()
                .onChanged{ gesture in
                    offset = gesture.translation
                    withAnimation{
                        changeColor(width: offset.width)
                    }
                    
                }
                .onEnded{ _ in
                    withAnimation {
                        swipeCard(width: offset.width)
                        changeColor(width: offset.width)
                    }
                    
                }
        )
    }
    
    func swipeCard(width: CGFloat){
        switch width{
        case -500...(-150):
            print("\(viewdata.username) removed")
            offset = CGSize(width: -500, height: 0)
        case 150...500:
            print("\(viewdata.username) added")
            offset = CGSize(width: 500, height: 0)
        default:
            offset = .zero
        }
        
    }


    func changeColor(width: CGFloat){
        switch width{
        case -500...(-130):
            color = .red
        case 130...500:
            color = .green
        default:
            color = .black
        }
    }
}



#Preview {
    CardView(viewdata: UserList(id: 0, username: "User 0", photo: "person"))
}
