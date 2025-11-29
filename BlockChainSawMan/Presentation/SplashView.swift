//
//  SplashView.swift
//  BlockChainSawMan
//
//  Created by 정태우 on 11/20/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                Image("blockList")
                    .padding(.top, 92)
                    .padding(.bottom, 12)
                    .padding(.horizontal, 4)
                
                Text("지식그래프 기반 B2B 온체인 AML 플랫폼")
                    .blockListFont(font: .BlockListRegular18, color: .white)
                    .frame(height: 27)
                    .padding(.bottom, 19)
                    .padding(.horizontal, 4)
                
                Image("splashMask")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 32)
                
                NavigationLink {
                    LoginView()
                } label: {
                    Text("회사 아이디로 로그인하기")
                        .blockListFont(font: .BlockListSemibold16, color: .black)
                        .padding(.vertical, 17.5)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(12)
                }
                .padding(.bottom, 12)
                
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.horizontal, 16)
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 20)
        }
    }
}

#Preview {
    SplashView()
}
