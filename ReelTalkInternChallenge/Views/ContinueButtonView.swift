//
//  ContinueButtonView.swift
//  ReelTalkInternChallenge
//
//  Created by Soyeon Lee on 12/2/23.
//

import SwiftUI

struct ContinueButtonView: View {
    
    var action: () -> Void
    @Environment(\.isEnabled) private var isEnabled
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(isEnabled ? Color("ButtonColor") : Color("Disabled"))
                .frame(width: 300, height: 48)
                .cornerRadius(8)
            
            Button(action: action) {
                Text("Continue")
                    .frame(width: 72, height: 23)
                    .font(FontStyle.boldBody.font)
                    .fontWeight(FontStyle.boldBody.weight)
                    .kerning(FontStyle.boldBody.letterSpacing)
                    .foregroundColor(isEnabled ? .black : Color("Disabled"))
                    .cornerRadius(8)
            }
        }
    }
}

#Preview {
    VStack {
        ContinueButtonView(action: {})
        ContinueButtonView(action: {})
            .disabled(true)
    }
}
