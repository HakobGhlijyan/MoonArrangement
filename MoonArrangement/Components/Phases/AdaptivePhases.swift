//
//  File: AdaptivePhases.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import SwiftUI

// MARK: - AdaptivePhases

/// Выбирает представление фаз по оси split-раскладки:
/// лента при вертикальном делении (view снизу), список при горизонтальном (рядом).
///
/// Важно: в Xcode 27.1 значение `splitArrangementAxis` внутри замыкания `ArrangementView`
/// приходило как `nil`, пока view не обернули в стек (`ZStack`). См. `AdaptiveSplitAxisDemo`.
///
/// Picks the phases presentation from the split axis: a strip for a vertical split
/// (stacked below), a list for a horizontal one (side by side).
///
/// Note: in Xcode 27.1 `splitArrangementAxis` read directly in the `ArrangementView` closure
/// was `nil` until the view was wrapped in a stack (`ZStack`). See `AdaptiveSplitAxisDemo`.
struct AdaptivePhases: View {

    // MARK: Environment

    /// Текущая ось деления; `nil` вне split-раскладки. / Current split axis; `nil` outside a split.
    @Environment(\.splitArrangementAxis) private var splitAxis

    // MARK: Body

    var body: some View {
        if splitAxis == .vertical {
            UpcomingPhasesStrip()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        } else {
            UpcomingPhasesList()
        }
    }
}

// MARK: - Preview

#Preview("AdaptivePhases - Light") {
    AdaptivePhases()
        .background { NightSkyBackground() }
        .preferredColorScheme(.light)
}

#Preview("AdaptivePhases - Dark") {
    AdaptivePhases()
        .background { NightSkyBackground() }
        .preferredColorScheme(.dark)
}
