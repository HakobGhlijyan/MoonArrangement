//
//  File: 09_OverlayEdgeDemo.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import SwiftUI

// MARK: - OverlayEdgeDemo

/// Выбор стороны при разделении: `.overlayArrangementEdge(_:)`.
/// Принимает горизонтальную сторону (виды рядом) или вертикальную (один над другим).
/// Здесь карточка уходит на leading, луна — на trailing.
///
/// Сторону задаём у ОБОИХ видов: в Xcode 27.1 при одной заданной `.trailing`
/// оба вида оказывались на trailing-стороне друг над другом.
///
/// Choosing the side on separation: `.overlayArrangementEdge(_:)`.
/// Accepts a horizontal edge (views side by side) or a vertical one (one above the other).
/// Here the card goes to leading and the moon to trailing.
///
/// Set the edge on BOTH views: in Xcode 27.1 a lone `.trailing` left both views
/// on the trailing side, one over the other.
struct OverlayEdgeDemo: View {

    // MARK: Body

    var body: some View {
        MoonScreenContainer {
            ArrangementView {
                TonightCard()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    .overlayArrangementEdge(.leading)
            } secondary: {
                MoonBackdrop()
                    .overlayArrangementEdge(.trailing)
            }
            .arrangementViewStyle(.overlay)
        }
    }
}

// MARK: - Preview

#Preview("OverlayEdgeDemo - Light") {
    OverlayEdgeDemo()
        .preferredColorScheme(.light)
}

#Preview("OverlayEdgeDemo - Dark") {
    OverlayEdgeDemo()
        .preferredColorScheme(.dark)
}
