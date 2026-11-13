//
//  File: 11_SideBySideStyleDemo.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import SwiftUI

// MARK: - SideBySideStyleDemo

/// Применение собственного стиля `.sideBySide` — то же поведение, что у
/// `.split.axes(.horizontal)`: на внешнем экране только primary, на внутреннем два вида рядом.
///
/// Applying the custom `.sideBySide` style — the same behavior as `.split.axes(.horizontal)`:
/// only the primary view on the outer display, two views side by side on the inner one.
struct SideBySideStyleDemo: View {

    // MARK: Body

    var body: some View {
        MoonScreenContainer {
            ArrangementView {
                TonightView()
            } secondary: {
                UpcomingPhasesList()
            }
            .arrangementViewStyle(.sideBySide)
        }
    }
}

// MARK: - Preview

#Preview("SideBySideStyleDemo - Light") {
    SideBySideStyleDemo()
        .preferredColorScheme(.light)
}

#Preview("SideBySideStyleDemo - Dark") {
    SideBySideStyleDemo()
        .preferredColorScheme(.dark)
}
