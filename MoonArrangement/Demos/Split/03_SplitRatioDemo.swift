//
//  File: 03_SplitRatioDemo.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import SwiftUI

// MARK: - SplitRatioDemo

/// Доля пространства для вида: `.splitArrangementLayoutRatio(0.4)` → 40 %.
/// Это пожелание, а не жёсткое правило: вид не сжимается меньше своего контента,
/// а при частичном сгибе раскладка следует сгибу независимо от доли.
///
/// Space share for a view: `.splitArrangementLayoutRatio(0.4)` → 40%.
/// This is a preference, not a hard rule: a view is never smaller than its content,
/// and when partially folded the layout follows the fold regardless of the ratio.
struct SplitRatioDemo: View {

    // MARK: Body

    var body: some View {
        MoonScreenContainer {
            ArrangementView {
                TonightView()
            } secondary: {
                UpcomingPhasesList()
                    .splitArrangementLayoutRatio(0.4)
            }
        }
    }
}

// MARK: - Preview

#Preview("SplitRatioDemo - Light") {
    SplitRatioDemo()
        .preferredColorScheme(.light)
}

#Preview("SplitRatioDemo - Dark") {
    SplitRatioDemo()
        .preferredColorScheme(.dark)
}
