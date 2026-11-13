//
//  File: 06_AdaptiveSplitAxisDemo.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import SwiftUI

// MARK: - AdaptiveSplitAxisDemo

/// Адаптация контента к оси деления через `@Environment(\.splitArrangementAxis)`:
/// лента фаз под луной (вертикально) и полный список рядом с ней (горизонтально).
///
/// Обёртка `ZStack` обязательна в Xcode 27.1: без неё значение оси было `nil`
/// и не обновлялось при смене раскладки. В поздних релизах может не понадобиться.
///
/// Adapting content to the split axis via `@Environment(\.splitArrangementAxis)`:
/// a phases strip below the moon (vertical) and the full list beside it (horizontal).
///
/// The `ZStack` wrapper is required in Xcode 27.1: without it the axis was `nil`
/// and didn't update when the layout changed. It may be unnecessary in later releases.
struct AdaptiveSplitAxisDemo: View {

    // MARK: Body

    var body: some View {
        MoonScreenContainer {
            ArrangementView {
                TonightView()
            } secondary: {
                ZStack {
                    AdaptivePhases()
                }
            }
        }
    }
}

// MARK: - Preview

#Preview("AdaptiveSplitAxisDemo - Light") {
    AdaptiveSplitAxisDemo()
        .preferredColorScheme(.light)
}

#Preview("AdaptiveSplitAxisDemo - Dark") {
    AdaptiveSplitAxisDemo()
        .preferredColorScheme(.dark)
}
