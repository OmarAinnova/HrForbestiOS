//
//  TableItemView.swift
//  Hr
//
//  Created by Omar Yousef on 09/09/2024.
//

import SwiftUI

struct TableItemView: View {
    var text: LocalizedStringKey
    var icon: String
    var backgroundColor: Color
    var onItemClicked : () -> Void
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(backgroundColor)
                    .frame(width: 50, height: 50)
                Image(systemName: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
            }
            Text(text)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .frame(height: 32) // Height adjusted to accommodate two lines exactly
                .padding(.top, 8)
        }.onTapGesture {
            onItemClicked()
        }
    }
}

#Preview {
    TableItemView(text: "Hi", icon: "star.fill", backgroundColor: .cyan) {
        
    }
}

struct TableItemWithBackgroundView: View {
    var text: String
    var icon: String
    var backgroundColor: Color
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(backgroundColor)
                    .frame(width: 50, height: 50)
                Image(systemName: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
            }
            Text(text)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(.top, 8)
        }
        .padding()
        .background(.white)
        .cornerRadius(12)
           
    }
}


#Preview {
    TableItemWithBackgroundView(text: "Hi", icon: "star.fill", backgroundColor: .cyan)
}

