//
//  LoginView.swift
//  BlockChainSawMan
//
//  Created by 정태우 on 11/20/25.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    @State private var companyName: String = ""
    @State private var ID: String = ""
    @State private var password: String = ""
    @State private var isExpanded = false
    @State private var showPassword: Bool = false
    @State private var options = ["블록체인쏘맨", "포치타", "하야카와 아키", "덴지", "마키마", "파워", "레제", "빔"]
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image("backButton")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                    .padding(.vertical, 18)
                    
                    Spacer()
                }
                
                Image("blockList")
                    .padding(.top, 32)
                    .padding(.bottom, 12)
                    .padding(.horizontal, 4)
                
                Text("지식그래프 기반 B2B 온체인 AML 플랫폼")
                    .blockListFont(font: .BlockListRegular18, color: .white)
                    .frame(height: 27)
                    .padding(. bottom, 39)
                    .padding(.horizontal, 4)
                
                Button {
                    isExpanded.toggle()
                } label: {
                    HStack {
                        Text(companyName.isEmpty ? "회사 검색" : companyName)
                            .blockListFont(font: .BlockListRegular16, color: .white)
                        
                        Spacer()
                        
                        Image("arrowDown")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                    .padding(.vertical, 15)
                    .padding(.horizontal, 20)
                    .background(.white.opacity(0.1))
                    .cornerRadius(16)
                    .padding(.bottom, 32)
                }
                
                ZStack(alignment: .leading) {
                    if ID.isEmpty {
                        Text("아이디")
                            .blockListFont(font: .BlockListRegular16, color: .white.opacity(0.8))
                            .allowsHitTesting(false)
                    }
                    
                    TextField("", text: $ID)
                        .blockListFont(font: .BlockListRegular16, color: .white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.vertical, 17.5)
                .padding(.horizontal, 20)
                .background(.white.opacity(0.1))
                .cornerRadius(16)
                .frame(height: 54)
                .padding(.bottom, 12)
                
                HStack {
                    if showPassword {
                        ZStack(alignment: .leading) {
                            if password.isEmpty {
                                Text("비밀번호")
                                    .blockListFont(font: .BlockListRegular16, color: .white.opacity(0.8))
                                    .allowsHitTesting(false) 
                            }
                            
                            TextField("", text: $password)
                                .blockListFont(font: .BlockListRegular16, color: .white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    } else {
                        ZStack(alignment: .leading) {
                            if password.isEmpty {
                                Text("비밀번호")
                                    .blockListFont(font: .BlockListRegular16, color: .white.opacity(0.8))
                            }
                            
                            SecureField("", text: $password)
                                .blockListFont(font: .BlockListRegular16, color: .white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }

                    Button {
                        showPassword.toggle()
                    } label: {
                        Image(showPassword ? "eyeSlash" : "eye")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                }
                .padding(.vertical, 15)
                .padding(.horizontal, 20)
                .background(.white.opacity(0.1))
                .cornerRadius(16)
                .padding(.bottom, 12)
                
                NavigationLink {
                    MainView()
                } label: {
                    Text("로그인")
                        .blockListFont(font: .BlockListSemibold16, color: .black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 17.5)
                        .background(companyName.isEmpty || ID.isEmpty || password.isEmpty ? Color(hex: "8A8B8F") : .white)
                        .cornerRadius(12)
                }
                .padding(.bottom, 20)
                .disabled(companyName.isEmpty || ID.isEmpty || password.isEmpty)
                
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 20)
            
            if isExpanded {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(options, id: \.self) { option in
                        Button {
                            companyName = option
                            withAnimation {
                                isExpanded = false
                            }
                        } label: {
                            HStack {
                                Text(option)
                                    .blockListFont(font: .BlockListRegular16, color: .white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.vertical, 14)
                                    .padding(.horizontal, 20)
                                
                                Spacer()
                                
                                Image("check")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundStyle(option == companyName ? .white : .clear)
                                    .padding(.trailing, 20)
                            }
                        }
                        .background(.white.opacity(0.2))
                    }
                }
                .background(.white.opacity(0.2))
                .background(
                    Image("background")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                )
                .cornerRadius(12)
                .padding(.horizontal, 16)
                .offset(y: 30)
                .zIndex(10)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    LoginView()
}
