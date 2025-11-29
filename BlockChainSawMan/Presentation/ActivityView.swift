//
//  ActivityView.swift
//  BlockChainSawMan
//
//  Created by 정태우 on 11/27/25.
//

import SwiftUI
import UIKit

struct ActivityView: UIViewControllerRepresentable {
    var items: [Any]  // 공유할 항목들
    var excludedActivityTypes: [UIActivity.ActivityType]?  // 제외할 활동 종류

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        activityViewController.excludedActivityTypes = excludedActivityTypes
        return activityViewController
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
