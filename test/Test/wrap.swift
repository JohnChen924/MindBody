//
//  wrap.swift
//  Test
//
//  Created by John Chen on 2/12/24.
//

import SwiftUI

struct Page2Wrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> Page2 {
        Page2()
    }
    
    func updateUIViewController(_ uiViewController: Page2, context: Context) {
        // Update the controller if needed.
    }
}


