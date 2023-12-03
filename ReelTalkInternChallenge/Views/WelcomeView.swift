//
//  WelcomeView.swift
//  ReelTalkInternChallenge
//
//  Created by Soyeon Lee on 11/30/23.
//

import SwiftUI

struct WelcomeView: View {
    
    @State var currentTabIndex: Int = 0
    @State var isContinueActive: Bool = false
    @StateObject var onboardingViewModel = OnboardingViewModel()
    let buttonColor = Color("ButtonColor")
    let currentPageIndicatorColor = UIColor(named: "ButtonColor")
    let pageIndicatorColor = UIColor(named: "HighEmphasis")
    
    
    init () {
        UIPageControl.appearance().currentPageIndicatorTintColor = currentPageIndicatorColor
        UIPageControl.appearance().pageIndicatorTintColor = pageIndicatorColor
        
    }
    
    var body: some View {
        
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                
                TabView(selection: $currentTabIndex) {
                    WelcomeItemView(imageName: "Welcome1", text: "Welcome to Reel Talk, a community\n designed for true film and TV Show fans")
                        .tag(1)
                    WelcomeItemView(imageName: "Welcome2", text: "Discover and discuss your favorite films, movies, and shows")
                        .tag(2)
                    WelcomeItemView(imageName: "Welcome3", text: "Let's get started!")
                        .tag(3)
                }
                .frame(height: 517)
                .padding(.top, 72)
                .tabViewStyle(PageTabViewStyle())
                
                HStack {
                    if currentTabIndex == 3 {
                        VStack {
                            
                            ContinueButtonView(action: { self.isContinueActive = true })
                                .sheet(isPresented: $isContinueActive) {
                                    SelectionView(viewModel: OnboardingViewModel())
                                }
                            
                            HStack {
                                Text("Already have an account?")
                                Text("Log in")
                                    .foregroundColor(Color("ButtonColor"))
                            }
                            .padding(.top, 24)
                            .font(FontStyle.boldBody.font)
                            .fontWeight(FontStyle.boldBody.weight)
                            .kerning(FontStyle.boldBody.letterSpacing)
                        }
                    } else {
                        Text("Already have an account?")
                        Text("Log in")
                            .foregroundColor(Color("ButtonColor"))
                    }
                }
                .padding(.top, 31)
                .font(FontStyle.subtitle.font)
                .foregroundColor(.highEmphasis)
                .fontWeight(.semibold)
                .kerning(FontStyle.subtitle.letterSpacing)
                
                Spacer()
            }
        }
    }
}

struct WelcomeItemView: View {
    let imageName: String
    let text: String
    
    var body: some View {
        VStack(alignment: .center) {
            Image(imageName)
                .frame(width: 300, height: 300)
                .padding(.horizontal, 46)
                .cornerRadius(20)
            
            Spacer()
                .frame(height: 84)
            
            Text(text)
                .frame(width: 360, height: 50, alignment: .center)
                .font(FontStyle.subtitle.font)
                .fontWeight(FontStyle.subtitle.weight)
                .kerning(FontStyle.subtitle.letterSpacing)
                .multilineTextAlignment(.center)
                .foregroundColor(.highEmphasis)
            
            Spacer()
                .frame(height: 32)
        }
    }
}

#Preview {
    WelcomeView()
}
