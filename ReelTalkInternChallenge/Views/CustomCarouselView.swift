//
//  CustomCarouselView.swift
//  ReelTalkInternChallenge
//
//  Created by Soyeon Lee on 12/1/23.
//

import SwiftUI

struct CustomCarouselView: View {
    
    let currentTabIndex: Int
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach((0..<3), id: \.self) { index in
                Rectangle()
                    .cornerRadius(4)
                    .foregroundColor(index == currentTabIndex ? Color("ButtonColor") : Color("Disabled"))
                    .frame(width: 80, height: 4)
            }
        }
    }
}

#Preview {
    CustomCarouselView(currentTabIndex: 0)
}
