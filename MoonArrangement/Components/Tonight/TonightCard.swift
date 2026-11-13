//
//  File: TonightCard.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import SwiftUI

// MARK: - TonightCard

/// Компактная карточка «Tonight» — основной контент в overlay-раскладке.
///
/// Compact "Tonight" card — the primary content of the overlay arrangement.
struct TonightCard: View {

    // MARK: Properties

    /// Данные о сегодняшней луне. / Tonight's moon data.
    var moon: TonightMoon = .sample

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading) {
            Text("Tonight")
                .font(.footnote)
                .foregroundStyle(MoonPalette.secondaryText)

            Text(moon.title)
                .font(.title3)
                .bold()
                .foregroundStyle(MoonPalette.primaryText)

            Text("\(moon.illumination, format: .percent.precision(.fractionLength(0))) lit · Full moon in \(moon.daysToFullMoon) days")
                .font(.footnote)
                .foregroundStyle(MoonPalette.secondaryText)
        }
        .padding()
        .background(MoonPalette.cardFill, in: .rect(cornerRadius: 24))
        .padding()
    }
}

// MARK: - Preview

#Preview("TonightCard - Light") {
    TonightCard()
        .background { NightSkyBackground() }
        .preferredColorScheme(.light)
}

#Preview("TonightCard - Dark") {
    TonightCard()
        .background { NightSkyBackground() }
        .preferredColorScheme(.dark)
}
