//
//  SplashView.swift
//  ReelTalkInternChallenge
//
//  Created by Soyeon Lee on 11/30/23.
//

import SwiftUI

struct SplashView: View {
    
    let splashDuration: TimeInterval = 2.0
    @State var isSplashComplete: Bool = false
    
    var body: some View {
        VStack {
            if self.isSplashComplete {
                WelcomeView()
            } else {
                ZStack {
                    
                    Color("BackgroundColor")
                    
                    VStack {
                        Image("Logo")
                            .frame(width: 176.06, height: 176.06)
                            .padding(.top, 233)
                        Text("REEL TALK")
                            .frame(width: 195, height: 41)
                            .padding(.top, 35.93)
                            .font(FontStyle.titleH1.font)
                            .fontWeight(FontStyle.titleH1.weight)
                            .kerning(FontStyle.titleH1.letterSpacing)
                            .foregroundColor(.white)
                            .lineSpacing(46.44)
                        
                        Spacer()
                    }
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + splashDuration) {
                withAnimation {
                    self.isSplashComplete = true
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
