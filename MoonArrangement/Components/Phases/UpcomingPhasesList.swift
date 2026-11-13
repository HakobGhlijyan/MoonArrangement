//
//  File: UpcomingPhasesList.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import SwiftUI

// MARK: - UpcomingPhasesList

/// Полный список ближайших фаз в карточке: иконка, название, дата.
///
/// Full list of upcoming phases in a card: icon, title, date.
struct UpcomingPhasesList: View {

    // MARK: Properties

    /// Фазы для показа. / Phases to display.
    var phases: [UpcomingPhase] = UpcomingPhase.sample

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading) {
            Text("Coming up")
                .font(.subheadline)
                .foregroundStyle(MoonPalette.secondaryText)

            ForEach(phases) { phase in
                if phase.id != phases.first?.id {
                    Divider()
                        .overlay(.white.opacity(0.15))
                }
                HStack {
                    PhaseIconView(kind: phase.kind)
                    Text(phase.kind.title)
                        .bold()
                        .foregroundStyle(MoonPalette.primaryText)
                    Spacer()
                    Text(phase.date, format: .dateTime.day().month(.abbreviated))
                        .foregroundStyle(MoonPalette.secondaryText)
                }
                .accessibilityElement(children: .combine)
            }
        }
        .padding()
        .background(MoonPalette.cardFill, in: .rect(cornerRadius: 24))
        .padding()
    }
}

// MARK: - Preview

#Preview("UpcomingPhasesList - Light") {
    UpcomingPhasesList()
        .background { NightSkyBackground() }
        .preferredColorScheme(.light)
}

#Preview("UpcomingPhasesList - Dark") {
    UpcomingPhasesList()
        .background { NightSkyBackground() }
        .preferredColorScheme(.dark)
}
