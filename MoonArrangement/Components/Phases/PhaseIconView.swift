//
//  File: PhaseIconView.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import SwiftUI

// MARK: - PhaseIconView

/// Маленькая иконка лунной фазы для строк списка.
///
/// Small lunar-phase icon for list rows.
struct PhaseIconView: View {

    // MARK: Properties

    /// Тип фазы. / Phase kind.
    let kind: MoonPhaseKind

    /// Размер иконки, масштабируется с Dynamic Type. / Icon size, scales with Dynamic Type.
    @ScaledMetric(relativeTo: .body) private var size: CGFloat = 22

    // MARK: Body

    var body: some View {
        ZStack {
            Circle()
                .fill(.white.opacity(0.35))

            MoonLitShape(illumination: kind.illumination)
                .fill(MoonPalette.moonLight)
                .scaleEffect(x: kind.isLitOnTrailingSide ? -1 : 1)

            Circle()
                .strokeBorder(MoonPalette.moonLight, lineWidth: 1.5)
        }
        .frame(width: size, height: size)
        .accessibilityHidden(true)
    }
}

// MARK: - Preview

#Preview("PhaseIconView - Light") {
    HStack {
        ForEach(MoonPhaseKind.allCases) { kind in
            PhaseIconView(kind: kind)
        }
    }
    .padding()
    .background { NightSkyBackground() }
    .preferredColorScheme(.light)
}

#Preview("PhaseIconView - Dark") {
    HStack {
        ForEach(MoonPhaseKind.allCases) { kind in
            PhaseIconView(kind: kind)
        }
    }
    .padding()
    .background { NightSkyBackground() }
    .preferredColorScheme(.dark)
}
