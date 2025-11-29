//
//  TradeListView.swift
//  BlockChainSawMan
//
//  Created by 정태우 on 11/20/25.
//

import SwiftUI

struct TradeListView: View {
    @Environment(\.dismiss) var dismiss
    @State private var trades: [Trade] = Trade.dummyTrades
    @State private var selectedTrade: Trade?
    
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
                    
                    Spacer()
                    
                    Text("거래 목록")
                        .blockListFont(font: .BlockListBold20, color: .white)
                    
                    Spacer()
                    
                    Rectangle()
                        .frame(width: 24, height: 24)
                        .opacity(0)
                }
                .frame(height: 60)
                
                Text("거래 목록을 선택해\n두 지갑의 위험 여부를 확인해보세요!")
                    .blockListFont(font: .BlockListBold22, color: .white)
                    .lineSpacing(22 * 0.25)
                    .frame(height: 66)
                    .padding(.top, 32)
                    .padding(.bottom, 32)
                    .padding(.horizontal, 4)
                
                ScrollView(showsIndicators: false) {
                    ForEach(trades) { trade in
                        Button {
                            if selectedTrade == trade {
                                selectedTrade = nil
                            } else {
                                selectedTrade = trade
                            }
                        } label: {
                            VStack(alignment: .leading, spacing: 4) {
                                HStack {
                                    Text("거래\(trade.id)")
                                        .blockListFont(font: .BlockListRegular12, color: .white.opacity(0.5))
                                    
                                    Spacer()
                                    
                                    Text(trade.date)
                                        .blockListFont(font: .BlockListRegular12, color: .white.opacity(0.5))
                                }
                                .frame(height: 18)
                                
                                HStack(spacing: 4) {
                                    Text(trade.firstAddress)
                                        .blockListFont(font: .BlockListRegular16, color: .white)
                                    
                                    Image("arrowRight")
                                        .resizable()
                                        .frame(width: 16, height: 16)
                                    
                                    Text(trade.secondAddress)
                                        .blockListFont(font: .BlockListRegular16, color: .white)
                                }
                                .frame(height: 24)
                                
                                Text("\(trade.price) \(trade.coin)")
                                    .blockListFont(font: .BlockListBold16, color: .white)
                            }
                            .padding(16)
                            .background(.white.opacity(selectedTrade == trade ? 0.3 : 0.1))
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
                
                Spacer()
                
                NavigationLink {
                    AnalysisView(walletAddress: .constant(selectedTrade?.firstAddress ?? "123123123123"), secondWalletAddress: .constant(selectedTrade?.secondAddress ?? "12312312312"))
                } label: {
                    Text("조회하기")
                        .blockListFont(font: .BlockListSemibold16, color: .black)
                        .padding(.vertical, 17.5)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(12)
                }
                .disabled(selectedTrade == nil)
                .padding(.bottom, 40)
            }
            .padding(.horizontal, 16)
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 20)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    TradeListView()
}
