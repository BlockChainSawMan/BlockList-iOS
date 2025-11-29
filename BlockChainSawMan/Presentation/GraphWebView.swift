//
//  GraphWebView.swift
//  BlockChainSawMan
//
//  Created by 정태우 on 11/18/25.
//

import SwiftUI
import WebKit

struct GraphWebView: UIViewRepresentable {
    var jsonString: String
    var onNodeTapped: (String) -> Void = { _ in }

    class Coordinator: NSObject, WKNavigationDelegate, WKScriptMessageHandler {
        var parent: GraphWebView

        init(parent: GraphWebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            let js = "window.renderGraph(\(parent.jsonString));"
            webView.evaluateJavaScript(js, completionHandler: nil)
        }

        func userContentController(_ userContentController: WKUserContentController,
                                   didReceive message: WKScriptMessage) {
            if message.name == "graphEvent",
               let id = message.body as? String {
                parent.onNodeTapped(id)
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.userContentController.add(context.coordinator, name: "graphEvent")

        let webView = WKWebView(frame: .zero, configuration: config)
        webView.navigationDelegate = context.coordinator
        if let htmlURL = Bundle.main.url(forResource: "graph", withExtension: "html") {
            webView.loadFileURL(htmlURL, allowingReadAccessTo: htmlURL.deletingLastPathComponent())
        } else {
            print("❌ graph.html not found in bundle.")
        }
        
        webView.isOpaque = false
        webView.backgroundColor = .clear
        webView.scrollView.backgroundColor = .clear

        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let js = "window.renderGraph(\(jsonString));"
        webView.evaluateJavaScript(js, completionHandler: nil)
    }
}
