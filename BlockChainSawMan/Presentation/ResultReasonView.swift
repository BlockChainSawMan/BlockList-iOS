//
//  ResultReasonView.swift
//  BlockChainSawMan
//
//  Created by 정태우 on 11/20/25.
//

import SwiftUI

struct ResultReasonView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var walletAddress: String
    @Binding var secondWalletAddress: String
    @Binding var dangerScore: Double
    @Binding var dangerScore2: Double
    @Binding var explanation: String
    @Binding var reason: String
    @Binding var patterns: [String]
    @Binding var explanation2: String
    @Binding var reason2: String
    @Binding var patterns2: [String]
    @Binding var data: EvidenceGraph
    @Binding var data2: EvidenceGraph
    @State var isByLink: Bool = true
    @State var isSharePresented: Bool = false
    @State var showToast: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
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

                        NavigationLink {
                            MainView()
                        } label: {
                            Image("home")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                    .frame(height: 60)
                    
                    Text("상세 분석 결과")
                        .blockListFont(font: .BlockListBold22, color: .white)
                        .padding(.top, 21)
                        .padding(.bottom, 32)
                    
                    HStack(spacing: 10) {
                        Image("wallet")
                            .resizable()
                            .frame(width: 20, height: 20)
                        
                        Text(walletAddress.map { String($0) }.joined(separator: " "))
                            .font(.custom("Glegoo-Regular", size: 22))
                            .foregroundStyle(.white)
                            .frame(height: 33)
                    }
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.white.opacity(0.5), lineWidth: 1)
                    )
                    .padding(.bottom, 32)
                    
                    Text("위험 점수")
                        .blockListFont(font: .BlockListRegular16, color: .white)
                        .padding(.bottom, 8)
                    
                    Text(String(format: "%.4f점", dangerScore))
                        .blockListFont(font: .BlockListBold40, color: .white)
                        .padding(.bottom, 20)
                    
                    Text(explanation)
                        .blockListFont(font: .BlockListRegular16, color: .white)
                        .frame(height: 26)
                    
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [4, 4], dashPhase: 0))
                        .foregroundColor(.white.opacity(0.2))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                        .padding(.vertical, 40)
                    
                    GraphWebView(
                        jsonString: encodeToJSONString(data),
                        onNodeTapped: { id in
                            print("Node tapped: \(id)")
                        }
                    )
                    .frame(height: 200)

                    HStack(spacing: 18) {
                        Spacer()
                        HStack(spacing: 6) {
                            Circle()
                                .foregroundStyle(Color(hex: "FF2F00"))
                                .frame(width: 10, height: 10)
                            
                            Text("dangerous_user")
                                .blockListFont(font: .BlockListRegular12, color: .white)
                        }
                        
                        HStack(spacing: 6) {
                            Circle()
                                .foregroundStyle(Color(hex: "4BC79D"))
                                .frame(width: 10, height: 10)
                            
                            Text("normal_user")
                                .blockListFont(font: .BlockListRegular12, color: .white)
                        }
                        
                        HStack(spacing: 6) {
                            Circle()
                                .foregroundStyle(Color(hex: "C4C4C4"))
                                .frame(width: 10, height: 10)
                            
                            Text("unknown")
                                .blockListFont(font: .BlockListRegular12, color: .white)
                        }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 32)
                    
                    Text(reason)
                        .blockListFont(font: .BlockListRegular14, color: .white.opacity(0.4))
                        .blockListFont(font: .BlockListRegular16, color: .white.opacity(0.4))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineSpacing(16 * 0.3)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 20)
                        .background(.white.opacity(0.05))
                        .cornerRadius(12)
                    
                    if !secondWalletAddress.isEmpty {
                        HStack(spacing: 10) {
                            Image("wallet")
                                .resizable()
                                .frame(width: 20, height: 20)
                            
                            Text(secondWalletAddress.map { String($0) }.joined(separator: " "))
                                .font(.custom("Glegoo-Regular", size: 22))
                                .foregroundStyle(.white)
                                .frame(height: 33)
                        }
                        .padding(.vertical, 16)
                        .frame(maxWidth: .infinity)
                        .background(.white.opacity(0.1))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.white.opacity(0.5), lineWidth: 1)
                        )
                        .padding(.top, 100)
                        .padding(.bottom, 32)
                        
                        Text("위험 점수")
                            .blockListFont(font: .BlockListRegular16, color: .white)
                            .padding(.bottom, 8)
                        
                        Text(String(format: "%.4f점", dangerScore2))
                            .blockListFont(font: .BlockListBold40, color: .white)
                            .padding(.bottom, 20)
                        
                        Text(explanation2)
                            .blockListFont(font: .BlockListRegular16, color: .white)
                            .frame(height: 26)
                        
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(style: StrokeStyle(lineWidth: 1, dash: [4]))
                            .foregroundColor(.white.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 40)
                        
                        GraphWebView(
                            jsonString: encodeToJSONString(data2),
                            onNodeTapped: { id in
                                print("Node tapped: \(id)")
                            }
                        )
                        .frame(height: 200)

                        HStack(spacing: 18) {
                            Spacer()
                            ForEach(data.nodes) { node in
                                HStack(spacing: 6) {
                                    Circle()
                                        .foregroundStyle(node.entity_type.toColor())
                                        .frame(width: 10, height: 10)
                                    
                                    Text(node.entity_type)
                                        .blockListFont(font: .BlockListRegular12, color: .white)
                                }
                            }
                            Spacer()
                        }
                        .padding(.bottom, 32)
                        
                        Text(reason2)
                            .blockListFont(font: .BlockListRegular16, color: .white.opacity(0.4))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineSpacing(16 * 0.3)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 20)
                            .background(.white.opacity(0.05))
                            .cornerRadius(12)
                    }
                    
                    if isByLink {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(style: StrokeStyle(lineWidth: 1, dash: [4]))
                            .foregroundColor(.white.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .padding(.vertical, 40)
                        
                        ForEach(patterns, id: \.self) { pattern in
                            Text("•  \(pattern)")
                                .blockListFont(font: .BlockListRegular16, color: .white.opacity(0.8))
                        }
                    } else {
                        Button {
                            sendToSlack(address: walletAddress, riskScore: dangerScore, status: "상", secondAddress: secondWalletAddress, riskScore2: dangerScore2, status2: "중")
                        } label: {
                            Text("슬랙으로 전송하기")
                                .blockListFont(font: .BlockListSemibold16, color: .black)
                                .padding(.vertical, 17.5)
                                .frame(maxWidth: .infinity)
                                .background(.white)
                                .cornerRadius(12)
                        }
                        .padding(.vertical, 20)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20)
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 20)
            }
            
            if showToast {
                Text("전송이 완료되었습니다.")
                    .blockListFont(font: .BlockListRegular16, color: .white)
                    .padding(.vertical, 17.5)
                    .padding(.horizontal, 20)
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(16)
                    .padding(.bottom, 160)
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
        .navigationBarBackButtonHidden()
    }
    
    func encodeToJSONString(_ data: EvidenceGraph) -> String {
        let encoder = JSONEncoder()
        let json = try! encoder.encode(data)
        return String(data: json, encoding: .utf8)!
    }
    
    func sendToSlack(address: String, riskScore: Double, status: String, secondAddress: String, riskScore2: Double, status2: String) {
        let webhook = Bundle.main.infoDictionary?["SLACK_WEBHOOK_URL"] ?? ""

        guard let url = URL(string:
                                webhook as! String) else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let payload: [String: Any] = [
            "text": "Blocklist의 \(address) 지갑 위험도 분석 결과입니다. \n\n위험 점수 : \(riskScore)\n위험 단계 : \(status)\n\nBlocklist의 \(secondAddress) 지갑 위험도 분석 결과입니다. \n\n위험 점수 : \(riskScore2)\n위험 단계 : \(status2)\n\n자세한 분석 결과는 링크를 확인해주세요.\nblocklist://resultDetail/\(walletAddress)?second=\(secondAddress)"
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: payload)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request).resume()
        showToast = true
    }
}

extension String {
    func toColor() -> Color {
        switch self {
        case "Hacker":
            return Color(hex: "#FF2F00")
        case "Mixer":
            return Color(hex: "#4BC79D")
        case "Unclassified":
            return Color(hex: "#C4C4C4")
        default:
            return .gray // 기본 색상
        }
    }
}
