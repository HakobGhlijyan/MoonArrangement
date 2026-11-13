//
//  File: TonightView.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import SwiftUI

// MARK: - TonightView

/// Основной контент экрана: луна, подпись «Tonight», название состояния и детали.
///
/// Primary screen content: the moon, a "Tonight" caption, the state title and details.
struct TonightView: View {

    // MARK: Properties

    /// Данные о сегодняшней луне. / Tonight's moon data.
    var moon: TonightMoon = .sample

    // MARK: Body

    var body: some View {
        VStack {
            MoonDiscView(illumination: moon.illumination)
                .padding()

            Text("Tonight")
                .font(.subheadline)
                .bold()
                .foregroundStyle(MoonPalette.secondaryText)

            Text(moon.title)
                .font(.largeTitle)
                .bold()
                .foregroundStyle(MoonPalette.primaryText)

            Text("\(moon.illumination, format: .percent.precision(.fractionLength(0))) lit · Full moon in \(moon.daysToFullMoon) days")
                .font(.footnote)
                .foregroundStyle(MoonPalette.secondaryText)
        }
        .multilineTextAlignment(.center)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

// MARK: - Preview

#Preview("TonightView - Light") {
    TonightView()
        .background { NightSkyBackground() }
        .preferredColorScheme(.light)
}

#Preview("TonightView - Dark") {
    TonightView()
        .background { NightSkyBackground() }
        .preferredColorScheme(.dark)
}
