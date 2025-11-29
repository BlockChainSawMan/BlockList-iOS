//
//  BlockChainSawManApp.swift
//  BlockChainSawMan
//
//  Created by 정태우 on 11/16/25.
//

import SwiftUI

enum Screen: Hashable {
    case resultDetail(walletAddress: String, secondWalletAddress: String)
}

@main
struct BlockListApp: App {
    @State private var deepLink: URL?
    @State private var path: [Screen] = []

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                SplashView()
                    .onOpenURL { url in
                        deepLink = url
                        handleDeepLink(url)
                    }
                    .navigationDestination(for: Screen.self) { screen in
                        switch screen {
                        case .resultDetail(let walletAddress, let secondWalletAddress):
                            AnalysisView(walletAddress: .constant(walletAddress), secondWalletAddress: .constant(secondWalletAddress))
                        }
                    }
            }
        }
    }
}

extension BlockListApp {
    func handleDeepLink(_ url: URL) {
        guard url.scheme == "blocklist" else { return }

        if url.host == "resultDetail" {
            guard let walletAddress = url.pathComponents.dropFirst().first else { return }

            let secondWalletAddress =
                URLComponents(url: url, resolvingAgainstBaseURL: false)?
                    .queryItems?
                    .first(where: { $0.name == "second" })?
                    .value ?? ""

            path.append(
                .resultDetail(
                    walletAddress: walletAddress,
                    secondWalletAddress: secondWalletAddress
                )
            )
        }
    }
}
