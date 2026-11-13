//
//  File: 05_FixedSizeSplitDemo.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import SwiftUI

// MARK: - FixedSizeSplitDemo

/// Вид берёт размер своего контента: `.splitArrangementFixedLayoutSize()`.
/// Компактная лента сохраняет собственную ширину, луне достаётся всё остальное.
/// Гибкий `frame` центрирует ленту в выделенной области.
///
/// A view takes the size of its content: `.splitArrangementFixedLayoutSize()`.
/// The compact strip keeps its own width while the moon gets the rest.
/// The flexible `frame` centers the strip in the space it receives.
struct FixedSizeSplitDemo: View {

    // MARK: Body

    var body: some View {
        MoonScreenContainer {
            ArrangementView {
                TonightView()
            } secondary: {
                UpcomingPhasesStrip()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .splitArrangementFixedLayoutSize()
            }
        }
    }
}

// MARK: - Preview

#Preview("FixedSizeSplitDemo - Light") {
    FixedSizeSplitDemo()
        .preferredColorScheme(.light)
}

#Preview("FixedSizeSplitDemo - Dark") {
    FixedSizeSplitDemo()
        .preferredColorScheme(.dark)
}
