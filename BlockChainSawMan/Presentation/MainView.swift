//
//  MainView.swift
//  BlockChainSawMan
//
//  Created by 정태우 on 11/20/25.
//

import SwiftUI

struct MainView: View {
    @State private var walletAddress: String = ""
    @State private var showToast: Bool = false
    @State private var goNext: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(alignment:. leading, spacing: 0) {
                Image("blockListLogo")
                    .padding(.top, 20)
                    .padding(.bottom, 52)
                
                Text("주소 입력 또는 거래 선택으로\n위험 지갑 여부를 확인해보세요!")
                    .blockListFont(font: .BlockListBold22, color: .white)
                    .lineSpacing(22 * 0.25)
                    .padding(.bottom, 32)
                
                HStack(spacing: 10) {
                    Image("wallet")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    ZStack(alignment: .leading) {
                        if walletAddress.isEmpty {
                            Text("지갑 주소 입력")
                                .blockListFont(font: .BlockListRegular16, color: .white.opacity(0.8))
                        }
                        
                        TextField("", text: $walletAddress)
                            .blockListFont(font: .BlockListRegular16, color: .white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(.vertical, 17)
                .padding(.horizontal, 20)
                .background(.white.opacity(0.1))
                .cornerRadius(16)
                .padding(.bottom, 12)

                NavigationLink(
                    destination: AnalysisView(walletAddress: $walletAddress, secondWalletAddress: .constant("")),
                    isActive: $goNext
                ) {
                    EmptyView()
                }

                Button {
                    if walletAddress.isEmpty {
                        showToast = true
                    } else {
                        goNext = true
                    }
                } label: {
                    Text("조회하기")
                        .blockListFont(font: .BlockListSemibold16, color: .black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 17.5)
                        .background(.white)
                        .cornerRadius(12)
                }
                .padding(.bottom, 90)
                
                HStack(spacing: 20) {
                    Rectangle()
                        .foregroundStyle(.white.opacity(0.2))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                    
                    Text("또는")
                        .blockListFont(font: .BlockListRegular16, color: .white.opacity(0.8))
                    
                    Rectangle()
                        .foregroundStyle(.white.opacity(0.2))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                }
                .padding(.horizontal, 4)
                .padding(.bottom, 40)
                
                NavigationLink {
                    TradeListView()
                } label: {
                    Text("거래 목록에서 선택하기")
                        .blockListFont(font: .BlockListSemibold16, color: .black)
                        .padding(.vertical, 17.5)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(12)
                }
                
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 20)
            
            if showToast {
                Text("지갑 주소를 입력해주세요")
                    .blockListFont(font: .BlockListRegular16, color: .white)
                    .padding(.vertical, 17.5)
                    .padding(.horizontal, 20)
                    .background(Color.black.opacity(0.4))
                    .cornerRadius(16)
                    .padding(.bottom, 60)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                showToast = false
                            }
                        }
                    }
            }
        }
        .animation(.easeInOut(duration: 0.3), value: showToast)
        .navigationBarBackButtonHidden()
    }
    
}

#Preview {
    MainView()
}
