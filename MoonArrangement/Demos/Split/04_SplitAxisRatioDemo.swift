//
//  File: 04_SplitAxisRatioDemo.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import SwiftUI

// MARK: - SplitAxisRatioDemo

/// Разные доли для разных осей (перегрузка с min/ideal/max):
/// 35–50 % (идеал 40 %) по ширине рядом с луной и 55 % по высоте под ней —
/// этого хватает, чтобы показать все четыре строки на внешнем экране.
///
/// Different shares per axis (the min/ideal/max overload):
/// 35–50% (ideal 40%) of the width beside the moon and 55% of the height below it —
/// enough to show all four rows on the outer display.
struct SplitAxisRatioDemo: View {

    // MARK: Body

    var body: some View {
        MoonScreenContainer {
            ArrangementView {
                TonightView()
            } secondary: {
                UpcomingPhasesList()
                    .splitArrangementLayoutRatio(
                        minHorizontal: 0.35,
                        idealHorizontal: 0.4,
                        maxHorizontal: 0.5,
                        idealVertical: 0.55
                    )
            }
        }
    }
}

// MARK: - Preview

#Preview("SplitAxisRatioDemo - Light") {
    SplitAxisRatioDemo()
        .preferredColorScheme(.light)
}

#Preview("SplitAxisRatioDemo - Dark") {
    SplitAxisRatioDemo()
        .preferredColorScheme(.dark)
}
