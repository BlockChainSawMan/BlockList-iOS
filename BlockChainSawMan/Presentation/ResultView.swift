//
//  ResultView.swift
//  BlockChainSawMan
//
//  Created by 정태우 on 11/20/25.
//

import SwiftUI

struct ResultView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var walletAddress: String
    @Binding var secondWalletAddress: String
    @Binding var dangerScore: Double
    @Binding var dangerScore2: Double
    @Binding var reason: String
    @Binding var reason2: String
    @Binding var explanation: String
    @Binding var patterns: [String]
    @Binding var explanation2: String
    @Binding var patterns2: [String]
    @Binding var status: String
    @Binding var status2: String
    @Binding var data: EvidenceGraph
    @Binding var data2: EvidenceGraph
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("위험 지갑 여부 판독 결과")
                            .blockListFont(font: .BlockListBold22, color: .white)
                            .padding(.bottom, 32)
                            .padding(.top, 21)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            HStack(spacing: 10) {
                                Image("wallet")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                
                                Text(walletAddress.map { String($0) }.joined(separator: " "))
                                    .font(.custom("Glegoo-Regular", size: 18))
                                    .foregroundStyle(.white)
                                    .frame(height: 27)
                            }
                            .padding(.bottom, 20)
                            
                            Rectangle()
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                                .foregroundStyle(.white.opacity(0.2))
                                .padding(.bottom, 40)
                            
                            Text("위험 점수")
                                .blockListFont(font: .BlockListRegular16, color: .white)
                                .padding(.bottom, 8)
                            
                            Text(String(format: "%.4f점", dangerScore))
                                .blockListFont(font: .BlockListBold40, color: .white)
                                .padding(.bottom, 20)
                            
                            Text("\(walletAddress)\(reason)")
                                .blockListFont(font: .BlockListRegular16, color: .white)
                                .lineSpacing(16 * 0.3)
                        }
                        .padding(20)
                        .padding(.bottom, 20)
                        .background(.white.opacity(0.08))
                        .cornerRadius(12)
                        
                        if !secondWalletAddress.isEmpty {
                            Spacer()
                                .frame(height: 20)
                            
                            VStack(alignment: .leading, spacing: 0) {
                                HStack(spacing: 10) {
                                    Image("wallet")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                    
                                    Text(secondWalletAddress.map { String($0) }.joined(separator: " "))
                                        .font(.custom("Glegoo-Regular", size: 18))
                                        .foregroundStyle(.white)
                                        .frame(height: 27)
                                }
                                .padding(.bottom, 20)
                                
                                Rectangle()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                                    .foregroundStyle(.white.opacity(0.2))
                                    .padding(.bottom, 40)
                                
                                Text("위험 점수")
                                    .blockListFont(font: .BlockListRegular16, color: .white)
                                    .padding(.bottom, 8)
                                
                                Text(String(format: "%.4f점", dangerScore2))
                                    .blockListFont(font: .BlockListBold40, color: .white)
                                    .padding(.bottom, 20)
                                
                                Text("\(secondWalletAddress)\(reason2)")
                                    .blockListFont(font: .BlockListRegular16, color: .white)
                                    .lineSpacing(16 * 0.3)
                            }
                            .padding(20)
                            .padding(.bottom, 20)
                            .background(.white.opacity(0.08))
                            .cornerRadius(12)
                        }
                    }
                }
                .mask(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .white, location: 0.0),
                            .init(color: .white, location: 0.9),
                            .init(color: .clear, location: 1.0)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .padding(.horizontal, 16)
                
                Spacer()
                
                NavigationLink {
                    ResultReasonView(walletAddress: $walletAddress, secondWalletAddress: $secondWalletAddress, dangerScore: $dangerScore, dangerScore2: $dangerScore2, explanation: $explanation, reason: $reason, patterns: $patterns, explanation2: $explanation2, reason2: $reason2, patterns2: $patterns2, data: $data, data2: $data2, status: $status, status2: $status2, isByLink: false)
                } label: {
                    Text("상세 분석 결과 확인하기")
                        .blockListFont(font: .BlockListSemibold16, color: .black)
                        .padding(.vertical, 17.5)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 40)
            }
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 20)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    MainView()
                } label: {
                    Image("home")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }
        }
    }
}

