//
//  AnalysisView.swift
//  BlockChainSawMan
//
//  Created by 정태우 on 11/20/25.
//

import SwiftUI

struct AnalysisView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var walletAddress: String
    @Binding var secondWalletAddress: String
    @State private var dangerScore: Double = 92
    @State private var dangerScore2: Double = 47
    @State private var reason: String = "232470704 지갑은 알려진 해커 지갑과 3단계 거래로 연결되어 있으며, 5개 지갑이 1개 지갑으로 집중 연결되어 있습니다. 또한 24시간 내 고액 송금 거래량이 비정상적으로 증가하여 의심 지갑으로 확인됩니다."
    @State private var reason2: String = "245230704 지갑은 알려진 해커 지갑과 3단계 거래로 연결되어 있으며, 5개 지갑이 1개 지갑으로 집중 연결되어 있습니다. 또한 24시간 내 고액 송금 거래량이 비정상적으로 증가하여 의심 지갑으로 확인됩니다."
    @State var explanation: String = "알려진 해커 지갑과 3단계 거래로 연결"
    @State var patterns: [String] = ["5개 지갑 > 1개 집중", "해커 지갑 0000로부터 3단계 연결", "24시간 내 비정상적 거래량 증가"]
    @State var explanation2: String = "알려진 해커 지갑과 3단계 거래로 연결"
    @State var patterns2: [String] = ["5개 지갑 > 1개 집중", "해커 지갑 0000로부터 3단계 연결", "24시간 내 비정상적 거래량 증가"]
    @State var graphData: EvidenceGraph = EvidenceGraph.dummy
    @State var graphData2: EvidenceGraph = EvidenceGraph.dummy
    @State var status: String = ""
    @State var status2: String = ""
    @State private var timer: Timer? = nil
    @State private var reasonNum: Int = 0
    @State private var goNext: Bool = false
    @State private var wallets: [String] = []

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .background(
                    NavigationLink(
                        destination: ResultView(walletAddress: $walletAddress, secondWalletAddress: $secondWalletAddress, dangerScore: $dangerScore, dangerScore2: $dangerScore2, reason: $reason, reason2: $reason2, explanation: $explanation, patterns: $patterns, explanation2: $explanation2, patterns2: $patterns2, status: $status, status2: $status2, data: $graphData, data2: $graphData2),
                        isActive: $goNext
                    ) { EmptyView() }
                )
            
            VStack(alignment:. leading, spacing: 0) {
                Text("지갑의 위험도 분석 중이에요")
                    .blockListFont(font: .BlockListBold22, color: .white)
                    .padding(.top, 22)
                    .padding(.bottom, 12)
                
                HStack(spacing: 10) {
                    Image("wallet")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Text(walletAddress.map { String($0) }.joined(separator: " "))
                        .font(.custom("Glegoo-Regular", size: 18))
                        .foregroundStyle(.white)
                        .frame(height: 27)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.bottom, 6)
                
                if !secondWalletAddress.isEmpty {
                    HStack(spacing: 10) {
                        Image("wallet")
                            .resizable()
                            .frame(width: 20, height: 20)
                        
                        Text(secondWalletAddress.map { String($0) }.joined(separator: " "))
                            .font(.custom("Glegoo-Regular", size: 18))
                            .foregroundStyle(.white)
                            .frame(height: 27)
                    }
                    .padding(.bottom, 6)
                }
                
                Spacer()
                    .frame(height: 5)
                
                LottieView(name: "LoadingAnimation")
                    .frame(width: 400, height: 400)
                    .opacity(0.3)
                    .frame(width: 200, height: 200)   // 화면에 보여주고 싶은 영역
                    .clipped()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 32.75)
                
                HStack(spacing: 4) {
                    Image(reasonNum > 0 ? "check" : "circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                    
                    Text("지갑 주소 확인 중")
                        .blockListFont(font: .BlockListRegular16, color: reasonNum > 0 ? .white : .white.opacity(0.5))
                }
                .frame(height: 26)
                .padding(.bottom, 12)
                
                HStack(spacing: 4) {
                    Image(reasonNum > 1 ? "check" : "circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                    
                    Text("글로벌 블랙리스트 DB 대조 중")
                        .blockListFont(font: .BlockListRegular16, color: reasonNum > 1 ? .white : .white.opacity(0.5))
                }
                .frame(height: 26)
                .padding(.bottom, 12)
                
                HStack(spacing: 4) {
                    Image(reasonNum > 2 ? "check" : "circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                    
                    Text("사기 거래 이력 및 패턴 스캔 중")
                        .blockListFont(font: .BlockListRegular16, color: reasonNum > 2 ? .white : .white.opacity(0.5))
                }
                .frame(height: 26)
                .padding(.bottom, 12)
                
                HStack(spacing: 4) {
                    Image(reasonNum > 3 ? "check" : "circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                    
                    Text("최종 위험도 스코어 산출 완료")
                        .blockListFont(font: .BlockListRegular16, color: reasonNum > 3 ? .white : .white.opacity(0.5))
                }
                .frame(height: 26)
                .padding(.bottom, 12)
                
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 20)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image("backButton")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            }
        }
        .onAppear {
            startTimer()
            wallets = [walletAddress]
            if !secondWalletAddress.isEmpty {
                wallets.append(secondWalletAddress)
            }
            postCheckWallet()
        }
        .onDisappear {
            timer?.invalidate()
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 4.0, repeats: true) { _ in
            reasonNum += 1
            if reasonNum == 3 {
                timer?.invalidate()
            }
        }
    }
    
    func postCheckWallet() {
        print("api 연동중")
        GraphAPI()
            .postCheckWallet(address: wallets)
            .request { result in
                switch result {
                case .success(let data):
                    print("DEBUG(postCheckWallet): \(data)")
                    if let first = data?.results.first {
                        dangerScore = first.riskScore
                        reason = first.explanation
                        explanation = first.explanationSummary
                        patterns = first.explanationBullet
                        status = first.status
                        let topEdges = Array(first.evidenceGraph.edges.prefix(6))
                        let connectedNodeIds = Set(topEdges.flatMap { [$0.source, $0.target] })
                        let topNodes = first.evidenceGraph.nodes.filter { connectedNodeIds.contains($0.id) }
                        let topGraph = EvidenceGraph(nodes: topNodes, edges: topEdges)
                        graphData = topGraph
                    }
                    if data?.results.count ?? 0 > 1 {
                        let second = data!.results[1]
                        dangerScore2 = second.riskScore
                        reason2 = second.explanation
                        explanation2 = second.explanationSummary
                        patterns2 = second.explanationBullet
                        status2 = second.status
                        let topEdges = Array(second.evidenceGraph.edges.prefix(6))
                        let connectedNodeIds = Set(topEdges.flatMap { [$0.source, $0.target] })
                        let topNodes = second.evidenceGraph.nodes.filter { connectedNodeIds.contains($0.id) }
                        let topGraph = EvidenceGraph(nodes: topNodes, edges: topEdges)
                        graphData2 = topGraph
                    }
                    reasonNum = 5
                    goNext = true
                case .failure(let error):
                    print("DEBUG \(#function): result \(error)")
                }
            }
    }
}
