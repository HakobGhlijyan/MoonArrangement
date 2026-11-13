//
//  File: 08_OverlayVerticalAxisDemo.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import SwiftUI

// MARK: - OverlayVerticalAxisDemo

/// Overlay, ограниченный вертикальной осью: `.overlay.axes(.vertical)`.
/// Виды не могут разойтись по двум сторонам вертикального сгиба и остаются наложенными,
/// оказываясь поверх сгиба. Подходит только для контента, который нормально выглядит через сгиб.
///
/// Overlay restricted to the vertical axis: `.overlay.axes(.vertical)`.
/// The views can't move to the two sides of a vertical fold and stay layered across it.
/// Use only for content that still looks fine across the fold.
struct OverlayVerticalAxisDemo: View {

    // MARK: Body

    var body: some View {
        MoonScreenContainer {
            ArrangementView {
                TonightCard()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            } secondary: {
                MoonBackdrop()
            }
            .arrangementViewStyle(.overlay.axes(.vertical))
        }
    }
}

// MARK: - Preview

#Preview("OverlayVerticalAxisDemo - Light") {
    OverlayVerticalAxisDemo()
        .preferredColorScheme(.light)
}

#Preview("OverlayVerticalAxisDemo - Dark") {
    OverlayVerticalAxisDemo()
        .preferredColorScheme(.dark)
}
