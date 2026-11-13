//
//  File: 02_HorizontalSplitDemo.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import SwiftUI

// MARK: - HorizontalSplitDemo

/// Split, ограниченный горизонтальной осью: `.split.axes(.horizontal)`.
/// Если разделить по разрешённой оси нельзя (внешний экран), показывается только primary.
/// Скрывать secondary уместно лишь когда он необязателен на маленьком экране.
///
/// Split restricted to the horizontal axis: `.split.axes(.horizontal)`.
/// When the split is impossible along the allowed axis (outer display), only the primary view shows.
/// Hide the secondary view only when its content is optional on the small display.
struct HorizontalSplitDemo: View {

    // MARK: Body

    var body: some View {
        MoonScreenContainer {
            ArrangementView {
                TonightView()
            } secondary: {
                UpcomingPhasesList()
            }
            .arrangementViewStyle(.split.axes(.horizontal))
        }
    }
}

// MARK: - Preview

#Preview("HorizontalSplitDemo - Light") {
    HorizontalSplitDemo()
        .preferredColorScheme(.light)
}

#Preview("HorizontalSplitDemo - Dark") {
    HorizontalSplitDemo()
        .preferredColorScheme(.dark)
}
