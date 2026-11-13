//
//  File: MoonDiscView.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import SwiftUI

// MARK: - MoonDiscView

/// Лунный диск: свечение, тёмная сторона, освещённая часть с кратерами и мягким терминатором.
/// Всегда квадратный и вписывается в предложенное пространство.
///
/// The lunar disc: glow, shadow side, lit part with craters and a soft terminator.
/// Always square and fits into the proposed space.
struct MoonDiscView: View {

    // MARK: Properties

    /// Освещённая доля диска, 0...1. / Illuminated fraction, 0...1.
    var illumination: Double = TonightMoon.sample.illumination

    // MARK: Body

    var body: some View {
        ZStack {
            Circle()
                .fill(MoonPalette.moonShadow)

            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [MoonPalette.moonCore, MoonPalette.moonLight],
                            center: .init(x: 0.35, y: 0.4),
                            startRadius: 0,
                            endRadius: 200
                        )
                    )
                MoonCratersShape()
                    .fill(.black.opacity(0.08))
                    .blur(radius: 3)
            }
            .mask {
                MoonLitShape(illumination: illumination)
                    .fill(.white)
                    .blur(radius: 3)
            }

            Circle()
                .strokeBorder(.white.opacity(0.2), lineWidth: 1)
        }
        .background {
            Circle()
                .fill(.white.opacity(0.25))
                .scaleEffect(1.4)
                .blur(radius: 30)
        }
        .aspectRatio(1, contentMode: .fit)
        .accessibilityElement()
        .accessibilityLabel("Moon")
        .accessibilityValue(Text(illumination, format: .percent.precision(.fractionLength(0))))
    }
}

// MARK: - Preview

#Preview("MoonDiscView - Light") {
    MoonDiscView()
        .padding()
        .background { NightSkyBackground() }
        .preferredColorScheme(.light)
}

#Preview("MoonDiscView - Dark") {
    MoonDiscView()
        .padding()
        .background { NightSkyBackground() }
        .preferredColorScheme(.dark)
}
