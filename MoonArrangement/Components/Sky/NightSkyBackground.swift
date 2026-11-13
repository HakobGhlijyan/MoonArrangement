//
//  File: NightSkyBackground.swift
//  Project: MoonArrangement
//  Target: MoonArrangement
//
//  Created by Hakob Ghlijyan on 11/13/26
//  Copyright © 2026 Hakob Ghlijyan. All rights reserved.
//  Confidential and proprietary.
//

import SwiftUI

// MARK: - NightSkyBackground

/// Ночное небо: вертикальный градиент и детерминированное звёздное поле.
///
/// Night sky: a vertical gradient with a deterministic starfield.
struct NightSkyBackground: View {

    // MARK: Configuration

    /// Количество звёзд. / Number of stars.
    var starCount: Int = 160

    // MARK: Body

    var body: some View {
        LinearGradient(
            colors: [MoonPalette.skyTop, MoonPalette.skyBottom],
            startPoint: .top,
            endPoint: .bottom
        )
        .overlay {
            Canvas { context, size in
                var generator = SeededGenerator(seed: 42)
                for _ in 0..<starCount {
                    let x = CGFloat.random(in: 0...size.width, using: &generator)
                    let y = CGFloat.random(in: 0...size.height, using: &generator)
                    let radius = CGFloat.random(in: 0.4...1.4, using: &generator)
                    let opacity = Double.random(in: 0.3...0.9, using: &generator)
                    let rect = CGRect(x: x - radius, y: y - radius, width: radius * 2, height: radius * 2)
                    context.fill(Path(ellipseIn: rect), with: .color(.white.opacity(opacity)))
                }
            }
            .allowsHitTesting(false)
        }
        .accessibilityHidden(true)
    }
}

// MARK: - Preview

#Preview("NightSkyBackground - Light") {
    NightSkyBackground()
        .preferredColorScheme(.light)
}

#Preview("NightSkyBackground - Dark") {
    NightSkyBackground()
        .preferredColorScheme(.dark)
}
