//
//  File: UpcomingPhasesStrip.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import SwiftUI

// MARK: - UpcomingPhasesStrip

/// Компактная лента фаз (иконка + дата) — вариант для узкого/низкого пространства.
///
/// Compact phase strip (icon + date) for narrow or short spaces.
struct UpcomingPhasesStrip: View {

    // MARK: Properties

    /// Фазы для показа. / Phases to display.
    var phases: [UpcomingPhase] = UpcomingPhase.sample

    // MARK: Body

    var body: some View {
        HStack {
            ForEach(phases) { phase in
                VStack {
                    PhaseIconView(kind: phase.kind)
                    Text(phase.date, format: .dateTime.day().month(.abbreviated))
                        .font(.caption2)
                        .foregroundStyle(MoonPalette.secondaryText)
                }
                .accessibilityElement(children: .combine)
                .accessibilityLabel(phase.kind.title)
            }
        }
        .padding()
        .background(MoonPalette.cardFill, in: .capsule)
    }
}

// MARK: - Preview

#Preview("UpcomingPhasesStrip - Light") {
    UpcomingPhasesStrip()
        .padding()
        .background { NightSkyBackground() }
        .preferredColorScheme(.light)
}

#Preview("UpcomingPhasesStrip - Dark") {
    UpcomingPhasesStrip()
        .padding()
        .background { NightSkyBackground() }
        .preferredColorScheme(.dark)
}
