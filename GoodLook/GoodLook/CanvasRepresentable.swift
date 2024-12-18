//
//  CanvasRepresentable.swift
//  GoodLook
//
//  Created by Claudia Scognamiglio  on 18/12/24.
//


import SwiftUI
import PencilKit

struct CanvasRepresentable: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView

    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.drawingPolicy = .anyInput
        canvasView.backgroundColor = .clear
        return canvasView
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {
        // No updates needed
    }
}
